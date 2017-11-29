package com.zss.web.backend.form.validator;

import com.zss.core.dal.entity.Channel;
import com.zss.core.plugin.MapContainer;
import com.zss.core.util.StringUtils;

public class ChannelFormValidator{

  public static MapContainer validateInsert(Channel channel){
    MapContainer form = new MapContainer();
    if(StringUtils.isBlank(channel.getName())){
      form.put("msg", "分类名称不能为空");
    }

    return form;
  }

}
