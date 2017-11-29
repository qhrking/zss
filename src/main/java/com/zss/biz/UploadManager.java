package com.zss.biz;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Component;

import com.zss.core.WebConstants;
import com.zss.core.dal.entity.Post;
import com.zss.core.dal.entity.Upload;
import com.zss.core.dal.entity.User;
import com.zss.core.plugin.PageModel;
import com.zss.core.util.DateUtils;
import com.zss.core.util.FileUtils;
import com.zss.service.PostService;
import com.zss.service.UploadService;
import com.zss.service.UserService;
import com.zss.service.vo.UploadVO;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Component
public class UploadManager{
  @Autowired
  private UploadService uploadService;
  @Autowired
  private PostService postService;
  @Autowired
  private UserService userService;

  private String allowSuffix = "jpg,png,gif,jpeg";//允许文件格式
  private long allowSize = 2L;//允许文件大小
  private String fileName;
  private String[] fileNames;

  public String getAllowSuffix() {
    return allowSuffix;
  }

  public void setAllowSuffix(String allowSuffix) {
    this.allowSuffix = allowSuffix;
  }

  public long getAllowSize() {
    return allowSize*1024*1024;
  }

  public void setAllowSize(long allowSize) {
    this.allowSize = allowSize;
  }

  public String getFileName() {
    return fileName;
  }

  public void setFileName(String fileName) {
    this.fileName = fileName;
  }

  public String[] getFileNames() {
    return fileNames;
  }

  public void setFileNames(String[] fileNames) {
    this.fileNames = fileNames;
  }

  /**
   *
   * <p class="detail">
   * 功能：重新命名文件
   * </p>
   * @author wangsheng
   * @date 2014年9月25日
   * @return
   */
  private String getFileNameNew(){
    SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmssSSS");
    return fmt.format(new Date());
  }

  public PageModel<UploadVO> list(int pageIndex, int pageSize){
    PageModel<UploadVO> result = uploadService.list(pageIndex, pageSize);
    for(UploadVO upload : result.getContent()){
      if(upload.getPostId()!=null){
        Post post = postService.loadById(upload.getPostId());
        upload.setPost(post);
      }
      User user = userService.loadById(upload.getCreator());
      upload.setUser(user);
    }

    return result;
  }

  /**
   * 添加上传记录并存储文件
   * 
   * @param resource
   * @param create
   * @param fileName
   * @param userId
   * @return 当前上传对象
   */
  public Upload insertUpload(Resource resource, Date create, String fileName, Integer userId){
    Upload upload = null;
    OutputStream out = null;
    try{
      String yearMonth = DateUtils.formatDate("yyyy/MM", create);
      File parent = new File(WebConstants.APPLICATION_PATH + "/post/upload", yearMonth);
      if(!parent.exists())
        parent.mkdirs();

      File savePath = FileUtils.determineFile(parent, fileName);
      IOUtils.copy(resource.getInputStream(), out = new FileOutputStream(savePath));

      upload = new Upload();
      //upload.setId(IdGenerator.uuid19());
      upload.setCreateTime(create);
      upload.setCreator(userId);
      upload.setName(fileName);
      upload.setPath("/post/upload/" + yearMonth + "/" + savePath.getName());

      uploadService.insert(upload);
    }catch(Exception e){
      e.printStackTrace();
      upload = null;
    }finally{
      IOUtils.closeQuietly(out);
    }

    return upload;
  }

  /**
   * 删除记录，同时删除文件
   * 
   * @param uploadid
   */
  public void removeUpload(Integer uploadid){
    Upload upload = uploadService.loadById(uploadid);
    uploadService.deleteById(uploadid);
    File file = new File(WebConstants.APPLICATION_PATH, upload.getPath());
    if(file.exists())
      file.delete();
    
    /* 注:当前目录为空同时删除父目录,如果父目录包含子文件/夹，会删除失败(File.delete中决定) */
    File parent = file.getParentFile();
    for(int i = 0; i < 2 && parent.list().length == 0; i++){
      parent.delete();
      parent = parent.getParentFile();
    }
  }

  public  String upload(MultipartFile file){
    OutputStream out = null;
    String filePath = null;
    Resource resource = null;
    try(InputStream in = file.getInputStream()){
      resource = new InputStreamResource(in);
    }catch(Exception e){
      e.printStackTrace();
    }
    String originalFilename = file.getOriginalFilename();
    try{
      String yearMonth = DateUtils.formatDate("yyyy/MM", new Date());
      File parent = new File(WebConstants.APPLICATION_PATH + "/upload", yearMonth);
      if(!parent.exists())
        parent.mkdirs();
      String suffix = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
      String newFileName=System.currentTimeMillis()+"."+suffix;
      File savePath = FileUtils.determineFile(parent, newFileName);
      IOUtils.copy(resource.getInputStream(), out = new FileOutputStream(savePath));

      filePath= "/upload/" + yearMonth + "/" + savePath.getName();
    }catch(Exception e){
      e.printStackTrace();
      filePath = null;
    }finally{
      IOUtils.closeQuietly(out);
    }

    return filePath;
  }

  /**
   * 添加上传记录并存储文件
   *
   * @param resource
   * @param create
   * @param originalFilename
   * @return 当前上传对象
   */
  public String upload(Resource resource, Date create, String originalFilename){
    OutputStream out = null;
    String filePath = null;
    try{
      String yearMonth = DateUtils.formatDate("yyyy/MM", create);
      File parent = new File(WebConstants.APPLICATION_PATH + "/upload", yearMonth);
      if(!parent.exists())
        parent.mkdirs();
      String suffix = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
      String newFileName=System.currentTimeMillis()+"."+suffix;
      File savePath = FileUtils.determineFile(parent, newFileName);
      IOUtils.copy(resource.getInputStream(), out = new FileOutputStream(savePath));


      filePath= "/upload/" + yearMonth + "/" + savePath.getName();

    }catch(Exception e){
      e.printStackTrace();
      filePath = null;
    }finally{
      IOUtils.closeQuietly(out);
    }

    return filePath;
  }


  /**
   *
   * <p class="detail">
   * 功能：文件上传
   * </p>
   * @author wangsheng
   * @date 2014年9月25日
   * @param files
   * @param destDir
   * @throws Exception
   */
  public void uploads(MultipartFile[] files, String destDir,HttpServletRequest request) throws Exception {
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    try {
      fileNames = new String[files.length];
      int index = 0;
      for (MultipartFile file : files) {
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1);
        int length = getAllowSuffix().indexOf(suffix);
        if(length == -1){
          throw new Exception("请上传允许格式的文件");
        }
        if(file.getSize() > getAllowSize()){
          throw new Exception("您上传的文件大小已经超出范围");
        }
        String realPath = request.getSession().getServletContext().getRealPath("/");
        File destFile = new File(realPath+destDir);
        if(!destFile.exists()){
          destFile.mkdirs();
        }
        String fileNameNew = getFileNameNew()+"."+suffix;//
        File f = new File(destFile.getAbsoluteFile()+"\\"+fileNameNew);
        file.transferTo(f);
        f.createNewFile();
        fileNames[index++] =basePath+destDir+fileNameNew;
      }
    } catch (Exception e) {
      throw e;
    }
  }

}
