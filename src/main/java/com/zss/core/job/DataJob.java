package com.zss.core.job;

import com.zss.biz.AppManager;
import com.zss.biz.aop.IndexManager;
import com.zss.core.dal.entity.App;
import com.zss.core.dal.entity.AppData;
import com.zss.core.dal.entity.Category;
import com.zss.core.plugin.ApplicationContextUtil;
import com.zss.core.util.DateUtil;
import com.zss.core.util.DateUtils;
import com.zss.core.util.FileUtils;
import com.zss.core.util.SslUtils;
import com.zss.service.AppService;
import com.zss.service.vo.AppVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import sun.rmi.runtime.Log;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by qhrking on 2017/10/10.
 */
public class DataJob implements Job {
    private static final Logger logger = LoggerFactory.getLogger(DataJob.class);
    static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:ss:mm'Z'");

    /**
     * 要调度的具体任务
     * @param arg0
     * @throws JobExecutionException
     */
    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
        logger.info("################小程序数据定时更新任务##############");
        AppService appService = ApplicationContextUtil.getBean(AppService.class);
        AppManager appManager = ApplicationContextUtil.getBean(AppManager.class);

        /*更新app数据*/
        logger.info("##########更新app数据开始###########");
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
                try{
                    appManager.insert(appData,categotyIds);
                }catch(Exception e) {
                    logger.info("DataJob insert  error,  appData={} | categotyIds={}",appData,categotyIds);
                    e.printStackTrace();
                }
            }
        }
        logger.info("##########更新app数据完成###########");

        logger.info("##########更新sitemap.xml文件开始###########");
        /*更新sitemap.xml文件*/
        StringBuilder xmlBuilder = new StringBuilder();
        buildUrlsetHeader(xmlBuilder);
        String domain = "http://www.haoapp.mobi";
        List<App> apps = appManager.listBySitemap();
        if (apps != null && !apps.isEmpty()) {
            for (App app : apps) {
                String changefreq = "daily";
                String priority = "1.0";
                int dayDiff = DateUtils.getDayDiff(new Date(), app.getUpdateTime());
                if (dayDiff > 30) {
                    changefreq = "monthly";
                    priority = "0.3";
                } else if (dayDiff > 7) {
                    changefreq = "weekly";
                    priority = "0.9";
                }
                buildUrl(xmlBuilder, domain + "/app/"+app.getId(), format.format(app.getUpdateTime()), changefreq, priority);
            }
        }
        buildUrlsetFooter(xmlBuilder);
        try {
            FileUtils.createFile(System.getProperty("catalina.home")+"/webapps/zss","sitemap",xmlBuilder.toString(),"xml");
            logger.info("创建sitemap.xml文件成功 ");
        } catch (IOException e) {
            logger.info("创建sitemap.xml文件失败 "+ e.getMessage());
            e.printStackTrace();
        }
        logger.info("##########更新sitemap.xml文件完成###########");
    }

    public static List<AppData> fetchData() {
        String url =  "https://minapp.com/api/v3/trochili/miniapp?limit=50";
        List<AppData> list = new ArrayList<AppData>();
        try {
            JSONObject dataObj = getData(url);
            JSONArray dataArr = JSONArray.fromObject(dataObj.get("objects"));
            //JSONObject objects =(JSONObject) jsonobject.get("objects");
            if(dataArr!=null){
                //JSONArray json = JSONArray.fromObject(objects ); // 首先把字符串转成 JSONArray  对象
                if(dataArr.size()>0){
                    for(int i=0;i<dataArr.size();i++){
                        AppData app = new AppData();
                        JSONObject appJson = dataArr.getJSONObject(i);  // 遍历 jsonarray 数组，把每一个对象转成 json 对象
                        //logger.info(appJson.get("title")+"=") ;  // 得到 每个对象中的属性值
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
                        app.setCategorys(categoryList);
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
         * @param urlAddress
         * @return
         */
    public static JSONObject  getData(String urlAddress){
        StringBuilder stringBuilder = new StringBuilder();
        JSONObject jsonobject = new JSONObject();
        URL u;
        List<AppData> list = new ArrayList<AppData>();
        try {
            URL url = new URL(urlAddress);
            if("https".equalsIgnoreCase(url.getProtocol())){
                SslUtils.ignoreSsl();
            }
            URLConnection urlConnection = url.openConnection();
            urlConnection.setDoOutput(true);
            urlConnection.setDoInput(true);
            urlConnection.setConnectTimeout(30000);
            urlConnection.setReadTimeout(30000);
            urlConnection.setRequestProperty("Charsert", "UTF-8"); //设置请求编码
            urlConnection.setUseCaches(false);
            urlConnection.setRequestProperty("Content-Type",
                    "application/json");
            urlConnection.connect();
            InputStream in = urlConnection.getInputStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(in, "UTF-8"));
            String inputLine = null;
            while ((inputLine = br.readLine()) != null) {
                stringBuilder.append(inputLine);
            }
            br.close();
            String str = stringBuilder.toString();
            StringBuffer stringBuffer = new StringBuffer(str);
            /*stringBuffer.delete(0, 9);
            stringBuffer.deleteCharAt(stringBuffer.length() - 1);*/
            //logger.info(stringBuffer);
            jsonobject = JSONObject.fromObject(stringBuffer.toString());
        } catch (Exception e) {
            logger.info("getData | 获取数据失败 errorMessage:"+e.getMessage());
            e.printStackTrace();
        }
        return jsonobject;
    }

    private void buildSitemapHeader(StringBuilder xmlBuilder) {
        buildHeader(xmlBuilder);
        xmlBuilder.append("<sitemapindex ");
        xmlBuilder.append(" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" ");
        xmlBuilder.append(" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9\" ");
        xmlBuilder.append(" xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\" ");
        xmlBuilder.append(" > ");
    }

    private void buildSitemapFooter(StringBuilder xmlBuilder) {
        xmlBuilder.append("</sitemapindex>");
        buildFooter(xmlBuilder);
    }

    private void buildUrlsetHeader(StringBuilder xmlBuilder) {
        buildHeader(xmlBuilder);
        xmlBuilder.append("<urlset");
        xmlBuilder.append(" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" ");
        xmlBuilder.append(" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9\" ");
        xmlBuilder.append(" xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\" ");
        xmlBuilder.append(" > ");
    }

    private void buildUrlsetFooter(StringBuilder xmlBuilder) {
        xmlBuilder.append("</urlset>");
        buildFooter(xmlBuilder);
    }

    private void buildHeader(StringBuilder xmlBuilder) {
        xmlBuilder.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
    }

    private void buildFooter(StringBuilder xmlBuilder) {
        xmlBuilder.append("<!-- This sitemap was generated by JPress --> ");
    }

    private void buildSitemap(StringBuilder xmlBuilder, String loc, String lastmod) {
        xmlBuilder.append("<sitemap>");
        xmlBuilder.append("<loc>" + loc + "</loc>");
        xmlBuilder.append("<lastmod>" + lastmod + "</lastmod>");
        xmlBuilder.append("</sitemap>");
    }

    private void buildUrl(StringBuilder xmlBuilder, String loc, String lastmod, String changefreq, String priority) {
        xmlBuilder.append("<url>");
        xmlBuilder.append("<loc>" + loc + "</loc>");
        xmlBuilder.append("<lastmod>" + lastmod + "</lastmod>");
        xmlBuilder.append("<changefreq>" + changefreq + "</changefreq>");
        xmlBuilder.append("<priority>" + priority + "</priority>");
        xmlBuilder.append("</url>");
    }

    public static void main(String[] arg){
        List<AppData> appList = fetchData();
        Collections.sort(appList, new Comparator<AppData>() {
            @Override
            public int compare(AppData o1, AppData o2) {
                return o1.getCreateTime().compareTo(o2.getCreateTime());
            }
        });

    }
}