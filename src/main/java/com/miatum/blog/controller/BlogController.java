package com.miatum.blog.controller;

import com.alibaba.fastjson.JSONObject;
import com.miatum.blog.common.DataTransform;
import com.miatum.blog.entity.Blog;
import com.miatum.blog.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
public class BlogController {
    @Autowired
    private BlogService blogService;
    private DataTransform dataTransform;
    @RequestMapping("/selectAllBlog")
    @ResponseBody
    public List<Blog> selectAllBlog(){
        return blogService.selectAllBlog();
    }

    @RequestMapping("/selectAllBlog_layuiTable")
    @ResponseBody
    public JSONObject selectAllBlog_layuiTable(){
        /**
        *@Author: miatum
        *@Description: dataTransform.forLayUiTable 转成layui数据表格要求数据格式的方法
        *@Date: 7:08 2020/9/28
        */
        List<Blog> blogs=blogService.selectAllBlog();
        JSONObject jsonObject=dataTransform.forLayUiTable(blogs);
        return jsonObject;
    }

    @RequestMapping("/deleteBlog")
    @ResponseBody
    public int deleteBlog(int id){
        return blogService.deleteBlog(id);
    }

    @RequestMapping(value = "/deleteBlogs",produces = "application/json")
    @ResponseBody
    public int deleteBlog(@RequestBody List<Blog> blogs){
        int[] ids = new int[blogs.size()];
        for (int i = 0;i < blogs.size();i++) {
            ids[i] = blogs.get(i).getId();
        }
        return blogService.deleteBlogs(ids);
    }

    @RequestMapping("/updateBlog")
    @ResponseBody
    public int updateBlog(@RequestBody Blog blog){
        return blogService.updateBlog(blog);
    }

    @RequestMapping("/insertBlog")
    @ResponseBody
    public int insertBlog(@RequestBody Blog blog){
        return blogService.insertBlog(blog);
    }

}
