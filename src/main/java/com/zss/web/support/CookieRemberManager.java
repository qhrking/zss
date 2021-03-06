package com.zss.web.support;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zss.core.Constants;
import com.zss.core.dal.entity.User;
import com.zss.core.plugin.ApplicationContextUtil;
import com.zss.core.security.HashCalculator;
import com.zss.core.security.Hex;
import com.zss.core.util.CookieUtil;
import com.zss.core.util.IdGenerator;
import com.zss.core.util.StringUtils;
import com.zss.service.UserService;

/**
 * 基于cookie的会话管理器
 * 
 * @author zhou
 * 
 */
public class CookieRemberManager{
  private static final String COOKIE_KEY = IdGenerator.uuid19();

  public static User extractValidRememberMeCookieUser(HttpServletRequest request, HttpServletResponse response){
    CookieUtil cookieUtil = new CookieUtil(request, response);
    String token = cookieUtil.getCookie(Constants.COOKIE_CONTEXT_ID);
    if(StringUtils.isBlank(token))
      return null;

    String[] cookieTokens = token.split(":");
    if(cookieTokens.length != 3)
      return null;

    long tokenExpiryTime;
    try{
      tokenExpiryTime = new Long(cookieTokens[1]).longValue();
    }catch(Exception e){
      return null;
    }

    if(isTokenExpired(tokenExpiryTime))
      return null;

    UserService userService = ApplicationContextUtil.getBean(UserService.class);
    User user = userService.loadById(Integer.valueOf(cookieTokens[0]));
    if(user == null)
      return null;
    String expectTokenSignature = makeTokenSignature(Integer.valueOf(cookieTokens[0]), tokenExpiryTime, user.getPassword());

    return expectTokenSignature.equals(cookieTokens[2]) ? user : null;
  }

  /**
   * 用户id和密码生成cookie
   * 
   * @param request
   * @param response
   * @param userId
   * @param password
   * @param remeber
   */
  public static void loginSuccess(HttpServletRequest request, HttpServletResponse response, Integer userId,
      String password, boolean remeber){
    long tokenExpiryTime = remeber ? System.currentTimeMillis() + 7 * 24 * 3600 : -1;
    CookieUtil cookieUtil = new CookieUtil(request, response);
    String cookieValue = userId + ":" + tokenExpiryTime + ":" + makeTokenSignature(userId, tokenExpiryTime, password);
    if(remeber){
      cookieUtil.setCookie(Constants.COOKIE_CONTEXT_ID, cookieValue, true, 7 * 24 * 3600);
    }else{
      cookieUtil.setCookie(Constants.COOKIE_CONTEXT_ID, cookieValue, true);
    }
  }

  private static String makeTokenSignature(Integer userId, long tokenExpiryTime, String password){
    String s = userId + ":" + Long.toString(tokenExpiryTime) + ":" + password + ":" + COOKIE_KEY;
    return Hex.bytes2Hex(HashCalculator.md5(s.getBytes()));
  }

  public static void logout(HttpServletRequest request, HttpServletResponse response){
    CookieUtil cookieUtil = new CookieUtil(request, response);
    cookieUtil.removeCokie(Constants.COOKIE_CONTEXT_ID);
  }

  /**
   * 当前登录token是否过期
   * 
   * @param tokenExpiryTime
   * @return
   */
  private static boolean isTokenExpired(long tokenExpiryTime){
    return tokenExpiryTime == -1 ? false : tokenExpiryTime < System.currentTimeMillis();
  }

}
