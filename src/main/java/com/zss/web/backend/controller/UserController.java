package com.zss.web.backend.controller;

import java.util.Date;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zss.core.dal.entity.User;
import com.zss.core.plugin.MapContainer;
import com.zss.service.UserService;
import com.zss.web.backend.form.validator.UserFormValidator;
import com.zss.web.support.WebContextFactory;

@Controller
@RequestMapping("/backend/users")
@RequiresAuthentication
public class UserController{
  @Autowired
  private UserService userService;

  @RequestMapping(method = RequestMethod.GET)
  @RequiresRoles("admin")
  public String index(@RequestParam(value = "page", defaultValue = "1") int page, Model model){
    model.addAttribute("page", userService.list(page, 15));
    return "backend/user/list";
  }

  @RequestMapping(method = RequestMethod.POST)
  @RequiresRoles("admin")
  public String insert(User user, String repass, Model model){
    MapContainer form = UserFormValidator.validateInsert(user, repass);
    if(!form.isEmpty()){
      model.addAllAttributes(form);
      return "backend/user/edit";
    }

    //user.setId(IdGenerator.uuid19());
    user.setCreateTime(new Date());
    user.setUpdateTime(user.getCreateTime());

    userService.insert(user);
    return "redirect:/backend/users";
  }

  @RequestMapping(method = RequestMethod.PUT)
  public String update(User user, String repass, Model model){
    MapContainer form = UserFormValidator.validateUpdate(user, repass);
    if(!form.isEmpty()){
      model.addAllAttributes(form);
      model.addAttribute("user", user);
      return "backend/user/edit";
    }

    user.setUpdateTime(new Date());
    userService.update(user);
    return "redirect:/backend/users";
  }

  @ResponseBody
  @RequestMapping(value = "/{userId}", method = RequestMethod.DELETE)
  @RequiresRoles("admin")
  public Object remove(@PathVariable("userId") Integer userId){
    userService.deleteById(userId);
    return new MapContainer("success", true);
  }

  @RequestMapping(value = "/edit", method = RequestMethod.GET)
  public String edit(Integer uid, Model model){
    if(uid!=null)
      model.addAttribute("user", userService.loadById(uid));
    return "backend/user/edit";
  }

  @RequestMapping(value = "/my", method = RequestMethod.GET)
  public String my(Model model){
    model.addAttribute("my", WebContextFactory.get().getUser());
    return "backend/user/my";
  }

  @RequestMapping(value = "/my", method = RequestMethod.PUT)
  public String upmy(User user, String repass, Model model){
    MapContainer form = UserFormValidator.validateMy(user, repass);
    if(!form.isEmpty()){
      model.addAllAttributes(form);
      model.addAttribute("my", user);
      return "backend/user/my";
    }

    user.setRole(WebContextFactory.get().getUser().getRole());
    user.setUpdateTime(new Date());
    userService.update(user);
    return "redirect:/backend/users";
  }

}
