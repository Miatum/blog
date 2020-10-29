package com.miatum.blog.controller;

import com.alibaba.fastjson.JSONObject;
import com.miatum.blog.common.DataTransform;
import com.miatum.blog.entity.Blog_Type;
import com.miatum.blog.service.Blog_TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class BlogTypeController {
    @Autowired
    private Blog_TypeService blog_typeService;
    private DataTransform dataTransform;
    @RequestMapping("/blog_Type_layuiTable")
    @ResponseBody
    public JSONObject selectAllBlog_Type_layuiTable(){
        List<Blog_Type> blog_types=blog_typeService.selectAllBlog_Type();
        JSONObject jsonObject=dataTransform.forLayUiTable(blog_types);
        return jsonObject;
    }
    @RequestMapping("/deleteBlog_Type")
    @ResponseBody
    public int deleteBlog_Type(int id){
        return blog_typeService.deleteBlog_Type(id);
    }
    @RequestMapping("/deleteBlog_Types")
    @ResponseBody
    public int deleteBlog_Types(@RequestBody List<Blog_Type> types){
        int[] ids = new int[types.size()];
        for(int i = 0;i < types.size();i++){
            ids[i] = types.get(i).getId();
        }
        return blog_typeService.delteBlog_Types(ids);
    }
    @RequestMapping("/updateBlog_Type")
    @ResponseBody
    public int updateBlog_Type(Blog_Type blog_type){
        return blog_typeService.updateBlog_Type(blog_type);
    }
    @RequestMapping("/addBlog_Type")
    @ResponseBody
    public int addBlog_Type(Blog_Type blog_type){
        return blog_typeService.addBlog_Type(blog_type);
    }
}
