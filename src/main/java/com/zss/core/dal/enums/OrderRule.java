package com.zss.core.dal.enums;

/**
 * Created by huazhi on 2017/5/11.
 */
public enum OrderRule {

    TIMEDESC("", 1), //最新  默认
    HOTDESC("(view_count+collection_count*5)  desc", 2), //最热   浏览数+收藏数*5
    RECOMMENDDESC("is_recommend desc", 3),//推荐
    VIEWDESC("view_count desc", 4); //最多浏览

    // 成员变量
    private String value;
    private int index;

    // 构造方法
    private OrderRule(String name, int index) {
        this.value = name;
        this.index = index;
    }
    // 普通方法
    public static String getValue(int index) {
        for (OrderRule orderRule : OrderRule.values()) {
            if (orderRule.getIndex() == index) {
                return orderRule.value;
            }
        }
        return null;
    }
    // get set 方法
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }
    public int getIndex() {
        return index;
    }
    public void setIndex(int index) {
        this.index = index;
    }
}