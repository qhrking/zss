package com.zss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zss.core.dal.entity.Tag;
import com.zss.core.dal.mapper.BaseMapper;
import com.zss.core.dal.mapper.TagMapper;

@Service
public class TagService extends BaseService{
  @Autowired
  private TagMapper tagMapper;

  public List<String> listTagsByPost(Integer postId){
    return tagMapper.getTagsByPost(postId);
  }

  /**
   * 插入文章标签记录
   * 
   * @param tag
   * @return
   */
  public int insertBatch(List<Tag> tags){
    return tagMapper.insertBatch(tags);
  }

  public int deleteByPostId(Integer postId){
    return tagMapper.deleteByPostId(postId);
  }

  @Override
  protected BaseMapper getMapper(){
    return tagMapper;
  }

}
