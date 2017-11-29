package com.zss.core.util;

import com.zss.core.WebConstants;
import org.apache.commons.io.IOUtils;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;

/**
 * Created by huazhi on 2017/1/18.
 */
public class UploadUtil {

    public static String upload(MultipartFile file){
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
            File parent = new File(WebConstants.APPLICATION_PATH + "/uploads", yearMonth);
            if(!parent.exists())
                parent.mkdirs();
            String suffix = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
            String newFileName=System.currentTimeMillis()+"."+suffix;
            File savePath = FileUtils.determineFile(parent, newFileName);
            IOUtils.copy(resource.getInputStream(), out = new FileOutputStream(savePath));

            filePath= "/uploads/" + yearMonth + "/" + savePath.getName();
        }catch(Exception e){
            e.printStackTrace();
            filePath = null;
        }finally{
            IOUtils.closeQuietly(out);
        }

        return filePath;
    }
}
