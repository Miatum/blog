package com.miatum.blog.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.*;
import java.util.UUID;

@Service
public class FileUploadService {
    //开发路径
    private String path = "F:\\IDEA\\blog\\src\\main\\resources\\static\\pic\\blogpic";
    //war工作路径
    //private String path = "D:\\Program Files\\apache-tomcat-9.0.39-windows-x64\\apache-tomcat-9.0.39\\webapps\\ROOT\\WEB-INF\\classes\\static\\pic\\blogpic";
    public String savePicByFormData(MultipartFile file) throws IOException {
        if (!new File(path).exists()) {
            new File(path).mkdirs();
        }
        String fileName_origin = file.getOriginalFilename();
        int lastIndexOf = fileName_origin.lastIndexOf(".");
        String suffix = fileName_origin.substring(lastIndexOf);
        String fileName = UUID.randomUUID().toString().replace("-","") + suffix;
        File tempFile = new File(path,fileName);
        if (!tempFile.exists()) {
            tempFile.createNewFile();
        }
        file.transferTo(tempFile);
        return fileName;
    }
}
