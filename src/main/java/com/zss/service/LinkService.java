package com.zss.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zss.core.dal.entity.Link;
import com.zss.core.dal.mapper.BaseMapper;
import com.zss.core.dal.mapper.LinkMapper;
import com.zss.core.plugin.PageModel;

@Service
public class LinkService extends BaseService{
  @Autowired
  private LinkMapper linkMapper;
  
  public PageModel<Link> list(int pageIndex,int pageSize){
    PageModel<Link> pageModel=new PageModel<>(pageIndex, pageSize);
    list(pageModel);
    
    return pageModel;
  }

  @Override
  protected BaseMapper getMapper(){
    return linkMapper;
  }

}
