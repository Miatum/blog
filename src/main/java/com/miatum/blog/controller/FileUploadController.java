package com.miatum.blog.controller;

import com.alibaba.fastjson.JSONObject;
import com.miatum.blog.service.FileUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import java.io.*;


@Controller
public class FileUploadController {
    @Autowired
    private FileUploadService fileUploadService;
    @RequestMapping(value = "/savePicByFormData" , method = RequestMethod.POST)
    @ResponseBody
    public JSONObject savePicByFormData(@RequestParam("editormd-image-file") MultipartFile file) throws IOException {
        String filename = fileUploadService.savePicByFormData(file);
        JSONObject jsonObject = new JSONObject();
        String url = "/pic/blogpic/"+filename;
        jsonObject.put("success",1);
        jsonObject.put("message","上传成功");
        jsonObject.put("url",url);
        return jsonObject;
    }
}