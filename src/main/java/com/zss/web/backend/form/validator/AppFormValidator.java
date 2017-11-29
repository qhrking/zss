package com.zss.web.backend.form.validator;

import com.zss.core.dal.entity.App;
import com.zss.core.plugin.MapContainer;
import com.zss.core.util.StringUtils;

/**
 * Created by huazhi on 2017/1/18.
 */
public class AppFormValidator {

    public static MapContainer validateInsert(App app){
        MapContainer form = validateApp(app);


        return form;
    }

    private static MapContainer validateApp(App app){
        MapContainer form = new MapContainer();
        if(StringUtils.isBlank(app.getName())){
            form.put("msg", "需填写小程序名称");
        }


        return form;
    }

}
