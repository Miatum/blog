package com.miatum.blog.service;

import com.alibaba.fastjson.JSONObject;
import com.miatum.blog.entity.Blog;
import com.miatum.blog.mapper.BlogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.List;
import java.util.UUID;

@Service
public class BlogService {
    @Autowired
    private BlogMapper blogMapper;
    public Blog selectBlogById(int id){
        return blogMapper.selectBlogById(id);
    }
    public List<Blog> selectAllBlog(){
        return blogMapper.selectAllBlog();
    }
    public int updateBlog(Blog blog){
        return blogMapper.updateBlog(blog);
    }
    public int deleteBlog(int id){
        return blogMapper.deleteBlog(id);
    }
    public int deleteBlogs(int[] ids){
        return blogMapper.deleteBlogs(ids);
    }
    public int insertBlog(Blog blog){
        return blogMapper.insertBlog(blog);
    }

}
