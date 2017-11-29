package com.zss.web.front.controller;

import com.zss.core.Constants;
import com.zss.core.plugin.MapContainer;
import com.zss.core.plugin.PageModel;
import com.zss.service.AppService;
import com.zss.service.vo.AppVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by huazhi on 2017/3/13.
 */
@Controller
@RequestMapping("/search")
public class SearchController {
    @Autowired
    private AppService appService;



    @RequestMapping(value = "/{searchType}/keyword/{keyword}",method = RequestMethod.GET)
    public String search(@PathVariable(value = "keyword") String  keyword,@PathVariable(value = "searchType") String  searchType,@RequestParam(value = "page", defaultValue = "1") int page,HttpServletRequest request,Model model){
        if(keyword==null){
            Boolean isMobile= ((Boolean)request.getAttribute(Constants.SESSION_IS_MOBILE)).booleanValue();
            if(isMobile){
                return "/wap/app/search";
            }
            return "/app/search";
        }else{
            MapContainer map= new MapContainer();
            map.put("keyword",keyword);
            PageModel<AppVO> appPageModel =  appService.listByCondition(map, page, 10);
            model.addAttribute("page",appPageModel);
            Boolean isMobile= ((Boolean)request.getAttribute(Constants.SESSION_IS_MOBILE)).booleanValue();
            if(isMobile){
                return "/wap/app/result";
            }
            return "result";
        }
    }

    @RequestMapping(value="keyword/{keyword}",method = RequestMethod.GET)
    public String defaualt(@PathVariable(value = "keyword") String  keyword,HttpServletRequest request,Model model){
        return "forward:/search/app/keyword/"+keyword;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String index(@RequestParam(value = "keyword",required = false) String  keyword, HttpServletRequest request,Model model){
        Boolean isMobile= ((Boolean)request.getAttribute(Constants.SESSION_IS_MOBILE)).booleanValue();
        if(isMobile){
            if(keyword==null){
                return "/wap/app/search";
            }
        }
        return "forward:/search/app/keyword/"+keyword;
    }



}
