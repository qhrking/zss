package com.zss.core.job;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by qhrking on 2017/10/20.
 */
public class QuartzTest {

    public static void main(String[] args) {
        try {
            /*String job_name = "动态任务调度";
            System.out.println("【任务启动】开始(每10秒输出一次)...");
            QuartzManager.addJob(job_name, DataJob.class, "0/10 * * * * ?");
            Thread.sleep(5000);
            System.out.println("【修改时间】开始(每2秒输出一次)...");
            QuartzManager.modifyJobTime(job_name, "10/2 * * * * ?");
            Thread.sleep(6000);
            System.out.println("【移除定时】开始...");
            QuartzManager.removeJob(job_name);
            System.out.println("【移除定时】成功");
            System.out.println("【再次添加定时任务】开始(每10秒输出一次)...");
            QuartzManager.addJob(job_name, DataJob.class, "*//*10 * * * * ?");
            Thread.sleep(60000);
            System.out.println("【移除定时】开始...");
            QuartzManager.removeJob(job_name);
            System.out.println("【移除定时】成功");*/
            String job_name = "小程序数据更新任务";
            System.out.println("【任务启动】每天0点0分执行");
            //QuartzManager.addJob(job_name, DataJob.class, "0 0 0 * * ?",appService,appManager);//每天的0点0分
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String formatDateByPattern(Date date, String dateFormat){
        SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
        String formatTimeStr = null;
        if (date != null) {
            formatTimeStr = sdf.format(date);
        }
        return formatTimeStr;
    }
    public static String getCron(java.util.Date  date){
        String dateFormat="ss mm HH dd MM ? yyyy";
        return formatDateByPattern(date, dateFormat);
    }

}
