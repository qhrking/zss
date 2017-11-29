package com.zss.biz;

import com.zss.core.dal.entity.App;
import com.zss.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Component
public class AppManager {
    @Autowired
    private AppService appService;

    @Autowired
    private CategoryService categoryService;


    /**
     * 插入App 同时插入关联分类
     * @param app
     * @param categoryIds
     */
    @Transactional
    public void insert(App app,int[] categoryIds){
        int count = appService.insert(app);
        if(count==1){
            categoryService.insertAppCategory(app.getId(),categoryIds);
        }

    }


    public List<App> listBySitemap(){
        List<App> appList = appService.listBySitemap();
        return appList;
    }

}
