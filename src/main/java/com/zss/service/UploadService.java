package com.zss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zss.core.dal.entity.Upload;
import com.zss.core.dal.mapper.BaseMapper;
import com.zss.core.dal.mapper.UploadMapper;
import com.zss.core.plugin.PageModel;
import com.zss.service.vo.UploadVO;

@Service
public class UploadService extends BaseService{
  @Autowired
  private UploadMapper uploadMapper;

  public PageModel<UploadVO> list(int pageIndex, int pageSize){
    PageModel<UploadVO> pageModel = new PageModel<>(pageIndex, pageSize);
    list(pageModel);

    return pageModel;
  }

  public List<Upload> listByPostId(Integer postId){
    return uploadMapper.listByPostId(postId);
  }

  public void updatePostId(Integer postId, List<String> imgpaths){
    uploadMapper.updatePostId(postId, imgpaths);
  }

  /**
   * 将所有postId的记录置空,非删除记录
   * 
   * @param postId
   */
  public void setNullPostId(Integer postId){
    uploadMapper.setNullPostId(postId);
  }

  public void deleteByPostId(Integer postId){
    uploadMapper.deleteByPostId(postId);
  }

  @Override
  protected BaseMapper getMapper(){
    return uploadMapper;
  }

}
