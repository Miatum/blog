package com.miatum.blog.service;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.*;
import java.util.UUID;
@Service
public class FileUploadService {
    // 图片服务器
    private String path = "E:\\BlogPicServer";
    public String savePicByFormData (MultipartFile file) throws IOException {
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
