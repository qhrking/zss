package com.zss.web.front.controller;

import com.zss.biz.AppManager;
import com.zss.biz.UploadManager;
import com.zss.core.Constants;
import com.zss.core.dal.entity.App;
import com.zss.core.dal.entity.Category;
import com.zss.core.plugin.MapContainer;
import com.zss.core.plugin.PageModel;
import com.zss.core.util.JsoupUtils;
import com.zss.core.util.StringUtils;
import com.zss.service.AppService;
import com.zss.service.CategoryService;
import com.zss.service.vo.AppVO;
import com.zss.web.backend.form.validator.AppFormValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by huazhi on 2017/1/12.
 */
@Controller
@RequestMapping("/app")
public class AppController {
    @Autowired
    private AppService appService;
    @Autowired
    private CategoryService categoryService;

    @Autowired
    private AppManager appManager;

    @Autowired
    private UploadManager uploadManager;

    /**
     *  首页
     * @param page
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String index(@RequestParam(value = "page", defaultValue = "1") int page,HttpServletRequest request,Model model){
        MapContainer map= new MapContainer();
        /*最新*/
        map.put("orderType",1);
        PageModel<AppVO> listNew =  appService.listByCondition(map, page, 6);
        model.addAttribute("listNew",listNew);
        /*热度*/
        map.put("orderType", 2);
        PageModel<AppVO> listHot =  appService.listByCondition(map, page, 6);
        model.addAttribute("listHot",listHot);
        /*推荐*/
        map.put("orderType", 3);
        PageModel<AppVO> listRecommend =  appService.listByCondition(map, page, 6);
        model.addAttribute("listRecommend",listRecommend);
        Boolean isMobile= ((Boolean)request.getAttribute(Constants.SESSION_IS_MOBILE)).booleanValue();
        if(isMobile){
            return "/wap/app/index";
        }
        return "index";
    }


    /**
     * 排行榜
     * @param orderType
     * @param page
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "/rank", method = RequestMethod.GET)
    public String rank(@RequestParam(value = "orderType" ,required = false) String  orderType,@RequestParam(value = "page", defaultValue = "1") int page,HttpServletRequest request,Model model){
        MapContainer map= new MapContainer();
        PageModel<AppVO> appPageModel =  appService.listHot(map, page, 10);
        model.addAttribute("page",appPageModel);
        Boolean isMobile= ((Boolean)request.getAttribute(Constants.SESSION_IS_MOBILE)).booleanValue();
        if(isMobile){
            return "/wap/app/rank";
        }
        return "rank";
    }

    /**
     * 排行榜分页（更多）
     * @param page
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getRankList", method = RequestMethod.GET)
    public MapContainer getRankList(@RequestParam(value = "page", defaultValue = "1") int page){
        MapContainer map= new MapContainer();
        PageModel<AppVO> appPageModel = new PageModel<AppVO>(page);
        if(page<=10){
            appPageModel =  appService.listHot(map, page, 10);
            map.put("status", 1);
            map.put("msg", "获取成功");
        }else{
            map.put("status", 2);
            map.put("msg", "获取失败，排名TOP100，查询超出范围");
        }
        map.put("data", appPageModel);
        return map;
    }

    /**
     * 分类首页 (重定向)
     * @param categotyPath
     * @param page
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value="/{categotyPath:[a-z]+}",method = RequestMethod.GET)
    public String store(@PathVariable("categotyPath") String categotyPath, @RequestParam(value = "page", defaultValue = "1") int page,HttpServletRequest request,Model model){
        return "forward:/app/"+categotyPath+"/order/"+1;
    }

    /**
     * 分类页
     * @param categotyPath
     * @param orderType
     * @param page
     * @param request
     * @param model
     * @return
     * @throws IOException
     */
    @RequestMapping(value="/{categotyPath:[a-z]+}/order/{orderType}",method = RequestMethod.GET)
    public String store(@PathVariable("categotyPath") String categotyPath, @PathVariable("orderType") String  orderType,@RequestParam(value = "page", defaultValue = "1") int page,HttpServletRequest request,Model model) throws IOException {
        MapContainer map= new MapContainer();
        PageModel<AppVO> appPageModel = null;
        Category category = categoryService.getByPath(categotyPath);
        if(null!=category||categotyPath.equals("store")){
            if(null!=category){
                map.put("categoryId",category.getId());
            }
            if(null!=orderType&&(orderType.equals("1")||orderType.equals("2")||orderType.equals("3"))){
                map.put("orderType", orderType);
            }
            appPageModel =  appService.listByCondition(map ,page, 9);
        }else{
            return "404";
        }
        List<Category> categoryList = categoryService.list();
        model.addAttribute("page",appPageModel);
        model.addAttribute("categoryList",categoryList);
        model.addAttribute("categotyPath",categotyPath);
        model.addAttribute("orderType",orderType);
        Boolean isMobile= ((Boolean)request.getAttribute(Constants.SESSION_IS_MOBILE)).booleanValue();
        if(isMobile){
            return "/wap/app/app";
        }
        return "app";
    }

    /**
     * 详情页
     * @param appId
     * @param request
     * @param model
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/{appId:[0-9]+}", method = RequestMethod.GET)
    public String app(@PathVariable("appId") Integer appId, HttpServletRequest request,Model model) throws IOException {
        AppVO appVO = appService.getAppVOById(appId);
        if(null==appVO){
            return "404";
        }
        /*浏览数+1*/
        appVO.setViewCount(appVO.getViewCount()+1);
        appService.update(appVO);

        model.addAttribute("appVO",appVO);
        String picsStr=appVO.getPics();
        String[] pics=null;
        if(null!=picsStr){
            pics=appVO.getPics().split(",");
        }
        model.addAttribute("pics",pics);

        MapContainer map= new MapContainer();
        /*最新*/
        map.put("orderType",1);
        PageModel<AppVO> listNew =  appService.listByCondition(map, 1, 6);
        model.addAttribute("listNew",listNew);
        /*热度*/
        map.put("orderType", 2);
        PageModel<AppVO> listHot =  appService.listByCondition(map, 1, 6);
        model.addAttribute("listHot",listHot);
        Boolean isMobile= ((Boolean)request.getAttribute(Constants.SESSION_IS_MOBILE)).booleanValue();
        if(isMobile){
            String ua = ((HttpServletRequest) request).getHeader("user-agent").toLowerCase();
            if (ua.indexOf("micromessenger") > 0) {// 是微信浏览器
                model.addAttribute("isweixin",true);
            }
            return "/wap/app/detail";
        }
        return "detail";
    }

    /**
     * 提交页面
     * @param id
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "/apply", method = RequestMethod.GET)
    public String apply(Integer id, HttpServletRequest request,Model model){
       /* if(id!=null){
            model.addAttribute("post", appService.loadById(id));
        }*/

        model.addAttribute("categoryList", categoryService.list());
        Boolean isMobile= ((Boolean)request.getAttribute(Constants.SESSION_IS_MOBILE)).booleanValue();
        if(isMobile){
            return "/wap/app/add";
        }
        return "add";
    }

    /**
     * 提交保存
     * @param app
     * @param categoryIds
     * @param iconfile
     * @param qrcodeFile
     * @param picFileList
     * @param request
     * @param model
     * @param attr
     * @return
     */
    @RequestMapping(value = "/add",method = RequestMethod.POST)
     public String add(App app,
                             @RequestParam(value = "categoryId" ,required = false) int[] categoryIds,
                             @RequestParam(value = "iconFile" ,required = false) MultipartFile iconfile,
                             @RequestParam(value = "qrcodeFile" ,required = false) MultipartFile qrcodeFile,
                             @RequestParam(value = "picFile" ,required = false)List<MultipartFile> picFileList,HttpServletRequest request,Model model,RedirectAttributes attr){
        MapContainer result = AppFormValidator.validateInsert(app);
        if(!result.isEmpty()){
            attr.addFlashAttribute("success", false);
            attr.addFlashAttribute("msg", result.get("msg"));
            return "redirect:/app/apply";
        }

        if(iconfile.getSize()>0){
            String icon=null;
            try(InputStream in = iconfile.getInputStream()){
                icon = uploadManager.upload(new InputStreamResource(in),new Date(),iconfile.getOriginalFilename());
            }catch(Exception e){
                e.printStackTrace();
            }
            app.setIcon(icon);
        }

        if(qrcodeFile.getSize()>0){
            String qrcode = null;
            try(InputStream in = qrcodeFile.getInputStream()){
                qrcode = uploadManager.upload(new InputStreamResource(in),new Date(),qrcodeFile.getOriginalFilename());
            }catch(Exception e){
                e.printStackTrace();
            }
            app.setQrcode(qrcode);
        }

        List<String> picPaths = new ArrayList<>();
        if(picFileList.size()>0){
            for(MultipartFile pic:picFileList){
                if(pic.getSize()>0){
                    String picPath = null;
                    try(InputStream in = pic.getInputStream()){
                        picPath = uploadManager.upload(new InputStreamResource(in),new Date(),pic.getOriginalFilename());
                    }catch(Exception e){
                        e.printStackTrace();
                    }
                    if(picPath!=null){
                        picPaths.add(picPath);
                    }
                }
            }
        }
        String pics = StringUtils.join(picPaths,",");
        if(pics.length()>0){
            app.setPics(pics);
        }

        /*String tags = StringUtils.join(tagList,",");
        app.setTags(tags);*/

        /* 使用jsoup来对问题标题和内容进行过滤 */
        String name = HtmlUtils.htmlUnescape(app.getName());
        app.setName(JsoupUtils.simpleText(name));
        String description = HtmlUtils.htmlUnescape(app.getDescription());
        app.setDescription(JsoupUtils.simpleText(description));

        appManager.insert(app,categoryIds);
        attr.addFlashAttribute("success", true);
        attr.addFlashAttribute("msg","发布成功，请等待管理员审核");
        return "redirect:/app/apply";
    }


    /**
     * 文件上传
     * @param file
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/file/upload", method = RequestMethod.POST)
    public Object upload(@RequestParam("file")MultipartFile file, HttpServletRequest request){
        String filePth = null;
        try(InputStream in = file.getInputStream()){
            filePth = uploadManager.upload(new InputStreamResource(in), new Date(), file.getOriginalFilename());
        }catch(Exception e){
            e.printStackTrace();
        }
        MapContainer result = new MapContainer();
        result.put("success", true);
        result.put("filePth", filePth);

        return result;
    }

}
