package com.zss.service.vo;

import com.zss.core.dal.entity.*;

import java.util.List;

/**
 * 小程序业务对象
 * 
 * @author qianhao
 *
 */
public class AppVO extends App{
  private User user;
  private List<Category> categorys;



  public User getUser(){
    return user;
  }

  public void setUser(User user){
    this.user = user;
  }


  public List<Category> getCategorys() {
    return categorys;
  }

  public void setCategorys(List<Category> categorys) {
    this.categorys = categorys;
  }
}
