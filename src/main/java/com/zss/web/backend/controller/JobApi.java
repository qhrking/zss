package com.zss.web.backend.controller;

import com.zss.core.job.DataJob;
import com.zss.core.job.QuartzManager;
import com.zss.core.job.SitemapJob;
import com.zss.core.util.ServletUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;

/**
 * Created by qhrking on 2017/10/21.
 */
@Controller
@RequestMapping("/api/job")
public class JobApi {
    private static final String contentType = "text/plain; charset=UTF-8";
    /**
     * 添加任务
     * @param job
     * @param cron
     * @param response
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public void add(@RequestParam String  type,@RequestParam String  job,@RequestParam String  trigger,@RequestParam(value = "cron" ,required = false,defaultValue ="0 0 0 * * ?") String  cron,HttpServletResponse response){
        response.setContentType(contentType);
        String result=null;
        try {
            System.out.println("【添加任务】开始...");
            System.out.println("执行计划："+cron);
            if(type.equals("app")){
                QuartzManager.addJob(job,trigger, DataJob.class, cron);
            }else if(type.equals("sitemap")){
                QuartzManager.addJob(job,trigger, SitemapJob.class, cron);
            }else{
                result="添加任务失败：, error message: unknown type  任务类型<app/sitemap>";
                ServletUtils.sendText(response, result);
            }
            System.out.println("任务类型【"+type+"】启动成功 ");
            result="添加任务成功：任务类型<"+type+"> ， 执行计划<"+cron+">";
        } catch (Exception e) {
            System.out.println("任务启动失败 errorMessage："+e.getMessage());
            result="添加任务失败： 任务类型<"+type+"> , error message:"+e.getMessage();
            ServletUtils.sendText(response, result);
        }
        ServletUtils.sendText(response, result);
    }

    /**
     * 移除任务
     * @param job
     * @param response
     */
    @RequestMapping(value = "/remove", method = RequestMethod.GET)
    public void removeJob(@RequestParam(value = "job") String  job,HttpServletResponse response){
        response.setContentType(contentType);
        String result=null;
        try {
            System.out.println("【移除任务】开始...");
            QuartzManager.removeJob(job);
            System.out.println("【移除任务】成功");
            result="移除任务 "+job+" 成功";
        } catch (Exception e) {
            System.out.println("移除任务失败 errorMessage："+e.getMessage());
            result="移除任务 "+job+" 失败, error message:"+e.getMessage();
            ServletUtils.sendText(response, result);
        }
        ServletUtils.sendText(response, result);
    }

    /**
     * 修改任务
     * @param job
     * @param cron
     * @param response
     */
    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public void modifyJob(@RequestParam String  job,@RequestParam String  trigger,@RequestParam(value = "cron" ,required = false,defaultValue ="0 0 0 * * ?") String  cron,HttpServletResponse response){
        response.setContentType(contentType);
        String result=null;
        try {
            System.out.println("【修改任务】开始...");
            System.out.println("执行计划："+cron);
            QuartzManager.modifyJobTime(job, trigger,cron);
            System.out.println("【修改任务】成功");
            result="修改任务 "+job+" 成功 ，执行计划<"+cron+">";
        } catch (Exception e) {
            System.out.println("修改任务失败 errorMessage:"+e.getMessage());
            result="修改任务 "+job+ "失败 , error message："+e.getMessage();
            ServletUtils.sendText(response, result);
        }
        ServletUtils.sendText(response, result);
    }

    /**
     * 关闭所有定时任务
     * @param response
     */
    @RequestMapping(value = "/shutdownAll")
    public void shutdownJobs(HttpServletResponse response){
        response.setContentType(contentType);
        String result=null;
        try {
            System.out.println("【关闭所有定时任务】开始...");
            QuartzManager.shutdownJobs();
            System.out.println("【关闭所有定时任务】成功");
            result="关闭所有定时任务成功 ";
        } catch (Exception e) {
            System.out.println("关闭所有定时任务失败 errorMessage:"+e.getMessage());
            result="关闭所有定时任务失败 , error message:"+e.getMessage();
            ServletUtils.sendText(response, result);
        }
        ServletUtils.sendText(response, result);
    }


}
