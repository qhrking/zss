package com.zss.core.dal.mapper;

import com.zss.core.dal.entity.Category;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CategoryMapper extends BaseMapper{


    void insertAppCategory(@Param("appId")Integer id, @Param("categotyIds")int[] categotyIds);

    Category getByPath(String path);

    List<Category> listByAppId(Integer appId);


}
