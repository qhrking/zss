package com.zss.web.front.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import com.zss.core.dal.entity.Comment;
import com.zss.core.dal.entity.Post;
import com.zss.core.plugin.MapContainer;
import com.zss.core.util.CookieUtil;
import com.zss.core.util.JsoupUtils;
import com.zss.core.util.ServletUtils;
import com.zss.core.util.StringUtils;
import com.zss.service.CommentService;
import com.zss.service.OptionsService;
import com.zss.service.PostService;
import com.zss.web.front.validator.CommentValidator;

@Controller
@RequestMapping("/comments")
public class CommentController{
  @Autowired
  private CommentService commentService;
  @Autowired
  private PostService postService;
  @Autowired
  private OptionsService optionService;

  @ResponseBody
  @RequestMapping(method = RequestMethod.POST)
  public Object post(Comment comment, HttpServletRequest request, HttpServletResponse response){
    CookieUtil cookieUtil = new CookieUtil(request, response);
    if(StringUtils.isBlank(comment.getCreator().toString())){
      comment.setCreator(Integer.valueOf(cookieUtil.getCookie("comment_author")));
      comment.setUrl(cookieUtil.getCookie("comment_author_url", false));
      comment.setEmail(cookieUtil.getCookie("comment_author_email", false));
    }

    MapContainer form = CommentValidator.validate(comment);
    if(!form.isEmpty()){
      return form.put("success", false);
    }

    /*if(!"true".equals(optionsService.getOptionValue(OptionConstants.ALLOW_COMMENT)))
      return new MapContainer("success", false).put("msg", "当前禁止评论");*/

    Post post = postService.loadById(comment.getPostId());
    /*if(post == null || PostConstants.COMMENT_CLOSE.equals(post.getCommentStatus())){
      return new MapContainer("success", false).put("msg", "当前禁止评论");
    }*/

    if(StringUtils.isBlank(comment.getParent().toString())){
      comment.setParent(null);
    }

    /* 根据RFC-2109中的规定，在Cookie中只能包含ASCII的编码 */
    cookieUtil.setCookie("comment_author", comment.getCreator().toString(), "/", false, 365 * 24 * 3600, true);
    cookieUtil.setCookie("comment_author_email", comment.getEmail(), "/", false, 365 * 24 * 3600, false);
    cookieUtil.setCookie("comment_author_url", comment.getUrl(), "/", false, 365 * 24 * 3600, false);

    //comment.setId(IdGenerator.uuid19());
    comment.setIp(ServletUtils.getIp(request));
    comment.setAgent(request.getHeader("User-Agent"));
    comment.setCreateTime(new Date());
    comment.setUpdateTime(comment.getCreateTime());
    /* 使用jsoup来对帖子内容进行过滤 */
    String content = HtmlUtils.htmlUnescape(comment.getContent());
    comment.setContent(JsoupUtils.simpleText(content));
    commentService.insert(comment);
    return new MapContainer("success", true);
  }

}
