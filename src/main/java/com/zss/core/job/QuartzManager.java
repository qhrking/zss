package com.zss.core.job;

import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;
import static org.quartz.TriggerBuilder.newTrigger;
import static org.quartz.CronScheduleBuilder.cronSchedule;

/**
 * @author qianhao
 * @date 2017-10-20  22:30
 */
public class QuartzManager {
    private static SchedulerFactory gSchedulerFactory = new StdSchedulerFactory();
    private static String JOB_GROUP_NAME = "WXAPP_JOB_GROUP";
    private static String TRIGGER_GROUP_NAME = "WXAPP_TRIGGER_GROUP";

    /**
     * 添加一个定时任务，使用默认的任务组名，触发器名，触发器组名
     * @param jobName 任务名
     * @param cls 任务
     * @param cronExpression 时间设置
     */
    @SuppressWarnings("rawtypes")
    public static void addJob(String jobName,String triggerName, Class cls, String cronExpression) {
        try {
            /*Scheduler sched = gSchedulerFactory.getScheduler();
            // 任务名，任务组，任务执行类
            JobDetail jobDetail = new JobDetail(jobName, JOB_GROUP_NAME, cls);
            //可以传递参数
            jobDetail.getJobDataMap().put("param", "railsboy");
            // 触发器
            CronTrigger trigger = new CronTrigger(jobName, TRIGGER_GROUP_NAME);
            // 触发器名,触发器组
            trigger.setCronExpression(time);
            // 触发器时间设定
            sched.scheduleJob(jobDetail, trigger);
            // 启动
            if (!sched.isShutdown()) {
                sched.start();
            }*/


            // 1、创建一个JobDetail实例，指定Quartz
            JobDetail jobDetail = JobBuilder.newJob(cls)   // 任务执行类
                    .withIdentity(jobName, JOB_GROUP_NAME)// 任务名，任务组
                    .build();

            //2、创建Trigger
                CronTrigger trigger = newTrigger().withIdentity(triggerName, TRIGGER_GROUP_NAME)
                    .withSchedule(cronSchedule(cronExpression)).build();

            //3、创建Scheduler
            Scheduler scheduler=StdSchedulerFactory.getDefaultScheduler();

            //4、调度执行
            scheduler.scheduleJob(jobDetail, trigger);
            // 启动
            if (!scheduler.isShutdown()) {
                scheduler.start();
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    /**
     * 修改一个任务的触发时间(使用默认的任务组名，触发器名，触发器组名)
     * @param jobName
     * @param cronExpression
     */
    @SuppressWarnings("rawtypes")
    public static void modifyJobTime(String jobName, String triggerName,String cronExpression) {
        try {
            Scheduler sched = gSchedulerFactory.getScheduler();
            CronTrigger trigger = (CronTrigger) sched.getTrigger(new TriggerKey(jobName,TRIGGER_GROUP_NAME));
            if (trigger == null) {
                return;
            }
            String oldTime = trigger.getCronExpression();
            if (!oldTime.equalsIgnoreCase(cronExpression)) {
                JobDetail jobDetail = sched.getJobDetail(new JobKey(jobName,JOB_GROUP_NAME));
                Class objJobClass = jobDetail.getJobClass();
                removeJob(jobName);
                addJob(jobName,triggerName,objJobClass, cronExpression);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


    /**
     * 移除一个任务(使用默认的任务组名，触发器名，触发器组名)
     * @param jobName
     */
    public static void removeJob(String jobName) {
        try {
            Scheduler sched = gSchedulerFactory.getScheduler();
            sched.pauseTrigger(new TriggerKey(jobName,TRIGGER_GROUP_NAME));// 停止触发器
            sched.unscheduleJob(new TriggerKey(jobName,TRIGGER_GROUP_NAME));// 移除触发器
            sched.deleteJob(new JobKey(jobName,JOB_GROUP_NAME));// 删除任务
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 启动所有定时任务
     */
    public static void startJobs() {
        try {
            Scheduler sched = gSchedulerFactory.getScheduler();
            sched.start();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 关闭所有定时任务
     */
    public static void shutdownJobs() {
        try {
            Scheduler sched = gSchedulerFactory.getScheduler();
            if (!sched.isShutdown()) {
                sched.shutdown();
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

