package com.zss.core.dal.mapper;

import java.util.List;

import com.zss.core.dal.entity.Tag;

public interface TagMapper extends BaseMapper{

  public int insertBatch(List<Tag> list);
  
  public int deleteByPostId(Integer postId);
  
  public List<String> getTagsByPost(Integer postId);

}
