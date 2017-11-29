package com.zss.web.front.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.stream.XMLStreamException;

import com.zss.biz.AppManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zss.biz.PostManager;
import com.zss.biz.aop.StaticTemplate;
import com.zss.core.WebConstants;
import com.zss.core.dal.constants.OptionConstants;
import com.zss.core.dal.constants.PostConstants;
import com.zss.core.feed.ArticleAdapter;
import com.zss.core.feed.Channel;
import com.zss.core.feed.Channel.Article;
import com.zss.core.feed.RssFeedWriter;
import com.zss.core.util.ServletUtils;
import com.zss.core.util.StringUtils;
import com.zss.service.OptionsService;
import com.zss.service.vo.PostVO;

@Controller
public class IndexController{
  @Autowired
  private PostManager postManager;
  @Autowired
  private StaticTemplate staticTemplate;
  @Autowired
  private OptionsService optionService;
  @Autowired
  private AppManager appManager;

  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String index(@RequestParam(value = "page", defaultValue = "1") int page, String word, Model model){
    if(!StringUtils.isBlank(word)){
      word = word.trim();
      model.addAttribute("page", postManager.search(word, page));
      model.addAttribute("search", word);
      model.addAttribute(WebConstants.PRE_TITLE_KEY, word);
    }else{
      model.addAttribute("page", postManager.listPost(page, 10));
    }

    return "index";
  }

  @RequestMapping(value = "/feed")
  public void rss(HttpServletRequest request, HttpServletResponse response) throws IOException{
    Channel channel = new Channel();
    channel.setDomain(ServletUtils.getDomain(request));
    channel.setLogoUrl(channel.getDomain() + "/resource/img/logo.png");
    channel.setTitle(optionService.getOptionValue(OptionConstants.TITLE));
    channel.setDescription(optionService.getOptionValue(OptionConstants.DESCRIPTION));

    List<Article> items = new ArrayList<>();
    for(PostVO pvo : postManager.listRecent(10, PostConstants.POST_CREATOR_ALL)){
      items.add(new ArticleAdapter(pvo));
    }
    channel.setItems(items);
    response.setContentType("text/xml");
    try{
      RssFeedWriter.write(channel, response.getOutputStream());
    }catch(XMLStreamException | IOException e){
      throw new IOException(e);
    }
  }

  @RequestMapping("/restatic.json")
  public void restatic(HttpServletRequest request){
  }

}
