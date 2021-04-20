package com.miatum.blog.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.miatum.blog.entity.Blog;
import com.miatum.blog.service.BlogService;
import com.miatum.blog.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/api/blog")
public class BlogController {
    @Autowired
    private BlogService blogService;
    @Resource
    private RedisUtil redisUtil;
    @RequestMapping("/selectAllBlog")
    @ResponseBody
    public List<Blog> selectAllBlog() {
        return blogService.selectAllBlog();
    }
    @RequestMapping("/selectFeaturedBlog")
    @ResponseBody
    public List<Blog> selectFeaturedBlog() {
        return blogService.selectFeaturedBlog();
    }
    @RequestMapping("/selectPublicBlog")
    @ResponseBody
    public List<Blog> selectPublicBlog() {
        return blogService.selectPublicBlog();
    }
    @RequestMapping("/selectBlogByTypeId")
    @ResponseBody
    public List<Blog> selectBlogByTypeId(int typeId) {
        return blogService.selectBlogByTypeId(typeId);
    }
    @RequestMapping("/selectPublicBlogByTypeId")
    @ResponseBody
    public List<Blog> selectPublicBlogByTypeId(int typeId) {
        return blogService.selectPublicBlogByTypeId(typeId);
    }
    @RequestMapping("/deleteBlog")
    @ResponseBody
    public int deleteBlog(@RequestBody String request){
        JSONObject jsonObject = JSON.parseObject(request);
        int id = jsonObject.getIntValue("id");
        return blogService.deleteBlog(id);
    }
    @RequestMapping(value = "/deleteBlogs",produces = "application/json")
    @ResponseBody
    public int deleteBlog(@RequestBody List<Blog> blogs) {
        int[] ids = new int[blogs.size()];
        for (int i = 0;i < blogs.size();i++) {
            ids[i] = blogs.get(i).getId();
        }
        return blogService.deleteBlogs(ids);
    }
    @RequestMapping("/updateBlog")
    @ResponseBody
    public int updateBlog(@RequestBody Blog blog) {
        return blogService.updateBlog(blog);
    }
    @RequestMapping("/insertBlog")
    @ResponseBody
    public int insertBlog(@RequestBody Blog blog) {
        int result = blogService.insertBlog(blog);
        int id = blogService.lastInsertId();
        return id;
    }
}
