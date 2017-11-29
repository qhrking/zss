package com.zss.web.backend.controller;

import com.zss.biz.AppManager;
import com.zss.core.dal.entity.AppData;
import com.zss.core.dal.entity.Category;
import com.zss.core.util.DateUtil;
import com.zss.service.AppService;
import com.zss.service.vo.AppVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Created by qhrking on 2017/10/9.
 */
@Controller
@RequestMapping("/api/app")
public class AppApi {
    @Autowired
    private AppService appService;
    @Autowired
    private AppManager appManager;

    @RequestMapping(value = "/fetch", method = RequestMethod.GET)
    public void fetch(){
        List<AppData> appList = fetchData();
        Collections.sort(appList, new Comparator<AppData>() {
            @Override
            public int compare(AppData o1, AppData o2) {
                return o1.getCreateTime().compareTo(o2.getCreateTime());
            }
        });
        for (AppData appData:appList){
            List<AppVO> appVOList = appService.listByName(appData.getName());
            if(appVOList==null||appVOList.size()==0){
                List<Category> categoryList = appData.getCategorys();
                int[] categotyIds= new int[categoryList.size()];
                for(int i = 0;i<categoryList.size();i++){
                    categotyIds[i] = categoryList.get(i).getId();
                }
                appManager.insert(appData,categotyIds);
            }
        }
    }

    public static List<AppData> fetchData() {
        String url =  "https://minapp.com/api/v3/trochili/miniapp?limit=50";
        List<AppData> list = new ArrayList<AppData>();
        try {
            JSONObject dataStr = getData(url);
            JSONArray dataArr = JSONArray.fromObject(dataStr.get("objects"));
            //JSONObject objects =(JSONObject) jsonobject.get("objects");
            if(dataArr!=null){
                //JSONArray json = JSONArray.fromObject(objects ); // 首先把字符串转成 JSONArray  对象
                if(dataArr.size()>0){
                    for(int i=0;i<dataArr.size();i++){
                        AppData app = new AppData();
                        JSONObject appJson = dataArr.getJSONObject(i);  // 遍历 jsonarray 数组，把每一个对象转成 json 对象
                        //System.out.println(appJson.get("title")+"=") ;  // 得到 每个对象中的属性值
//            	    name,icon,qrcode,description,pics,score,category_id,tags,author,view_count,collection_count,is_recommend,status,creator,update_time,create_time
                        app.setName(appJson.get("name").toString());
                        JSONObject icon =  appJson.getJSONObject("icon");
                        app.setIcon(icon.get("image").toString());
                        JSONObject qrcode= appJson.getJSONObject("qrcode");
                        app.setQrcode(qrcode.get("image").toString());
                        app.setDescription(appJson.get("description").toString());

                        JSONArray screenshotArry = JSONArray.fromObject(appJson.get("screenshot"));
                        StringBuffer pics = new StringBuffer("");
                        for(int j=0;j<screenshotArry.size();j++){
                            JSONObject screenshotJson = screenshotArry.getJSONObject(j);
                            if(j+1==screenshotArry.size()){
                                pics.append(screenshotJson.get("image").toString());
                            }else{
                                pics.append(screenshotJson.get("image").toString()+",");
                            }
                        }
                        app.setPics(pics.toString());

                        JSONArray tagArry = JSONArray.fromObject(appJson.get("tag"));
                        StringBuffer tagNames = new StringBuffer("");
                        List<Category> categoryList = new ArrayList<>();
                        for(int k=0;k<tagArry.size();k++){
                            JSONObject tagJson = tagArry.getJSONObject(k);
                            Category category = new Category();
                            category.setId(Integer.parseInt(tagJson.get("id").toString()));
                            category.setName(tagJson.get("name").toString());
                            categoryList.add(category);
                            if(k+1==tagArry.size()){
                                tagNames.append(tagJson.get("name").toString());
                            }else{
                                tagNames.append(tagJson.get("name").toString()+",");
                            }
                        }
                        app.setTags(tagNames.toString());

                        app.setAuthor(appJson.get("created_by").toString());
                        String mp=appJson.get("mp_qrcode").toString();
                        if(null!=mp&&!mp.equals("")&&!mp.equals("null")){
                            JSONObject mp_qrcode =  appJson.getJSONObject("mp_qrcode");
                            app.setPublicQrcode(mp_qrcode.get("image").toString());
                        }
                        app.setViewCount(Integer.valueOf(appJson.get("visit_amount").toString()));
                        String updateTime = DateUtil.timeStamp2Date(appJson.get("created_at").toString(), "yyyy-MM-dd HH:mm:ss");
                        app.setUpdateTime(DateUtil.parse("yyyy-MM-dd HH:mm:ss",updateTime));
                        String createTime = DateUtil.timeStamp2Date(appJson.get("created_at").toString(), "yyyy-MM-dd HH:mm:ss");
                        app.setCreateTime(DateUtil.parse("yyyy-MM-dd HH:mm:ss",createTime));
                        list.add(app);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    /**
     *  从网络API接口中获取数据
     * @param url
     * @return
     */
    public static JSONObject  getData(String url){
        StringBuilder stringBuilder = new StringBuilder();
        JSONObject jsonobject = new JSONObject();
        URL oracle;
        List<AppData> list = new ArrayList<AppData>();
        try {
            oracle = new URL(url);
            URLConnection yc = oracle.openConnection();
            BufferedReader br = new BufferedReader(new InputStreamReader(yc.getInputStream()));
            String inputLine = null;
            while ((inputLine = br.readLine()) != null) {
                stringBuilder.append(inputLine);
            }
            br.close();
            String str = stringBuilder.toString();
            StringBuffer stringBuffer = new StringBuffer(str);
            /*stringBuffer.delete(0, 9);
            stringBuffer.deleteCharAt(stringBuffer.length() - 1);*/
            //System.out.println(stringBuffer);
            jsonobject = JSONObject.fromObject(stringBuffer.toString());
        } catch (Exception e) {
            System.out.println("getData | 获取数据失败 errorMessage:"+e.getMessage());
            e.printStackTrace();
        }
        return jsonobject;
    }

}
