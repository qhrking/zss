package com.zss.core.util;

import java.security.InvalidParameterException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import com.zss.core.Constants;

public class DateUtils{
  static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  static SimpleDateFormat dateSdf = new SimpleDateFormat("yyyyMMdd");

  public static String now() {
    return sdf.format(new Date());
  }

  public static String dateString() {
    return dateSdf.format(new Date());
  }

  public static String format(Date date) {
    if (null == date)
      return null;

    return sdf.format(date);
  }

  /**
   * 统计两个日期之间包含的天数。
   *
   * @param date1
   * @param date2
   * @return
   */
  public static int getDayDiff(Date date1, Date date2) {
    if (date1 == null || date2 == null) {
      throw new InvalidParameterException("date1 and date2 cannot be null!");
    }
    long millSecondsInOneDay = 24 * 60 * 60 * 1000;
    return (int) ((date1.getTime() - date2.getTime()) / millSecondsInOneDay);
  }



  public static void main(String[] args) throws ParseException {
    Date date = sdf.parse("2016-7-20 00:00:00");
    System.out.println(getDayDiff(new Date(), date));
  }

  private DateUtils(){
  }

  public static String currentDate(String pattern){
    return formatDate(pattern, new Date());
  }

  public static String formatDate(String pattern, Date date){
    SimpleDateFormat format = new SimpleDateFormat(pattern, Constants.LOCALE_CHINA);
    return format.format(date);
  }

  /**
   * 指定locale格式化日期
   * 
   * @param pattern
   * @param date
   * @param locale
   * @return
   */
  public static String formatDate(String pattern, Date date, Locale locale){
    SimpleDateFormat format = new SimpleDateFormat(pattern, locale);
    return format.format(date);
  }

  /**
   * 解析日期，注:此处为严格模式解析，即20151809这样的日期会解析错误
   * 
   * @param pattern
   * @param date
   * @return
   */
  public static Date parse(String pattern, String date){
    return parse(pattern, date, Constants.LOCALE_CHINA);
  }

  /**
   * 解析日期，注:此处为严格模式解析，即20151809这样的日期会解析错误
   * 
   * @param pattern
   * @param date
   * @param locale
   * @return
   */
  public static Date parse(String pattern, String date, Locale locale){
    SimpleDateFormat format = new SimpleDateFormat(pattern, locale);
    format.setLenient(false);
    Date result = null;
    try{
      result = format.parse(date);
    }catch(Exception e){
      e.printStackTrace();
    }

    return result;
  }

}
