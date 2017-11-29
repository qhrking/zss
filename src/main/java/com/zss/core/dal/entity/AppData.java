package com.zss.core.dal.entity;

import java.util.List;

/**
 * Created by qhrking on 2017/10/9.
 */
public class AppData extends App{
    private List<Category> categorys;

    public List<Category> getCategorys() {
        return categorys;
    }

    public void setCategorys(List<Category> categorys) {
        this.categorys = categorys;
    }
}
