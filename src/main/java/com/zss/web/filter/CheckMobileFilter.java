package com.zss.web.filter;

import com.zss.core.Constants;
import com.zss.core.util.CheckMobile;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class CheckMobileFilter extends OncePerRequestFilter {


    @Override
    protected void doFilterInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, FilterChain filterChain) throws ServletException, IOException {
        // 获得在下面代码中要用的request,response,session对象
        HttpSession session = httpServletRequest.getSession(true);

        boolean isMobile = false;
        /**
         * 检查访问方式是否为移动端
         */
        //检查是否已经记录访问方式（移动端或pc端）
        if(null==session.getAttribute(Constants.SESSION_USER_AGENT)){
            try{
                //获取ua，用来判断是否为移动端访问
                String userAgent = httpServletRequest.getHeader( "USER-AGENT" ).toLowerCase();
                if(null == userAgent){
                    userAgent = "";
                }
                isMobile= CheckMobile.check(userAgent);
                //判断是否为移动端访问
                if(isMobile){
                    System.out.println("移动端访问");
                    session.setAttribute(Constants.SESSION_USER_AGENT,Constants.SESSION_USER_AGENT_MOBILE);
                } else {
                    System.out.println("pc端访问");
                    session.setAttribute(Constants.SESSION_USER_AGENT,Constants.SESSION_USER_AGENT_PC);
                }
            }catch(Exception e){}
        }else{
            isMobile=session.getAttribute(Constants.SESSION_USER_AGENT).equals(Constants.SESSION_USER_AGENT_MOBILE);
        }
        httpServletRequest.setAttribute(Constants.SESSION_IS_MOBILE,isMobile);

        filterChain.doFilter(httpServletRequest, httpServletResponse);
    }


}
