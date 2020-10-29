package com.miatum.blog.controller;

import com.alibaba.fastjson.JSONObject;
import com.miatum.blog.common.DataTransform;
import com.miatum.blog.entity.Blog_Tag;
import com.miatum.blog.service.Blog_TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class BlogTagController {
    @Autowired
    private Blog_TagService blog_tagService;
    private DataTransform dataTransform;
    @RequestMapping("/blog_Tag_layuiTable")
    @ResponseBody
    public JSONObject selectAllBlog_Tag_layuiTable(){
        /**
        *@Author: miatum
        *@Description: 返回layui table格式JSON
        *@Date: 10:48 2020/9/28
        */
        List<Blog_Tag> blog_tags=blog_tagService.selectAllBlog_Tag();
        JSONObject jsonObject=dataTransform.forLayUiTable(blog_tags);
        return jsonObject;
    }
    @RequestMapping("/deleteBlog_Tag")
    @ResponseBody
    public int deleteBlog_Tag(int id){
        return blog_tagService.deleteBlog_Tag(id);
    }
    @RequestMapping("/deleteBlog_Tags")
    @ResponseBody
    public int deleteBlog_Tags(@RequestBody List<Blog_Tag> tags){
        int[] ids = new int[tags.size()];
        for (int i = 0;i < tags.size();i++){
            ids[i] = tags.get(i).getId();
        }
        return blog_tagService.deleteBlog_Tags(ids);
    }
    @RequestMapping("/updateBlog_Tag")
    @ResponseBody
    public int updateBlog_Tag(Blog_Tag blog_tag){
        return blog_tagService.updateBlog_Tag((blog_tag));
    }
    @RequestMapping("/addBlog_Tag")
    @ResponseBody
    public int addBlog_Tag(Blog_Tag blog_tag){
        return blog_tagService.addBlog_Tag((blog_tag));
    }
}
