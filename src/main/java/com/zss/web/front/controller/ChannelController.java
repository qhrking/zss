package com.zss.web.front.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zss.biz.PostManager;
import com.zss.core.WebConstants;
import com.zss.core.dal.entity.Channel;
import com.zss.service.ChannelService;

@Controller
@RequestMapping("/channels")
public class ChannelController{
  @Autowired
  private PostManager postManager;
  @Autowired
  private ChannelService channelService;

  @RequestMapping(value = "/{channelName}", method = RequestMethod.GET)
  public String post(@PathVariable("channelName") String channelName,
      @RequestParam(value = "page", defaultValue = "1") int page, Model model){
    Channel channel = channelService.loadByName(channelName);
    if(channel != null){
      model.addAttribute("page", postManager.listByChannel(channel, page, 10));
    }

    model.addAttribute("channel", channelName);
    model.addAttribute(WebConstants.PRE_TITLE_KEY, channelName);
    return "index";
  }

}
