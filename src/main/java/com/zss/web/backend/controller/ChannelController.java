package com.zss.web.backend.controller;

import java.util.Date;
import java.util.List;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zss.biz.ChannelManager;
import com.zss.core.dal.entity.Channel;
import com.zss.core.plugin.MapContainer;
import com.zss.core.util.CollectionUtils;
import com.zss.service.ChannelService;
import com.zss.web.backend.form.validator.ChannelFormValidator;

@Controller("adminChannelController")
@RequestMapping("/backend/channels")
@RequiresRoles(value = { "admin", "editor" }, logical = Logical.OR)
public class ChannelController{
  @Autowired
  private ChannelService channelService;
  @Autowired
  private ChannelManager channelManager;

  @RequestMapping(method = RequestMethod.GET)
  public String index(){
    return "backend/post/channel";
  }

  @ResponseBody
  @RequestMapping(value = "/index", method = RequestMethod.GET)
  public Object data(){
    List<MapContainer> list = channelManager.listAsTree();
    for(MapContainer temp : list){
      temp.put("text", temp.remove("name"));
      List<MapContainer> nodes = temp.get("nodes");
      if(CollectionUtils.isEmpty(nodes))
        continue;

      for(MapContainer child : nodes){
        child.put("text", child.remove("name"));
        child.put("icon", "glyphicon glyphicon-star");
      }
    }

    return list;
  }

  @ResponseBody
  @RequestMapping(method = RequestMethod.POST)
  public Object insert(Channel channel, String parent){
    MapContainer form = ChannelFormValidator.validateInsert(channel);
    if(!form.isEmpty()){
      return form.put("success", false);
    }

    //channel.setId(IdGenerator.uuid19());
    channel.setCreateTime(new Date());
    channel.setUpdateTime(channel.getCreateTime());
    return new MapContainer("success", channelService.insertChildren(channel, parent));
  }

  @ResponseBody
  @RequestMapping(value = "/{channelName}", method = RequestMethod.DELETE)
  public Object remove(@PathVariable String channelName){
    channelManager.remove(channelName);
    return new MapContainer("success", true);
  }

}
