package com.miatum.blog.service;

import com.miatum.blog.entity.Blog_Type;
import com.miatum.blog.mapper.Blog_TypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Blog_TypeService {
    @Autowired
    private Blog_TypeMapper blog_typeMapper;
    public Blog_Type selectBlog_TypeById(int id){
        return blog_typeMapper.selectBlog_TypeById(id);
    }
    public List<Blog_Type> selectAllBlog_Type(){
        return blog_typeMapper.selectAllBlog_Type();
    }
    public int updateBlog_Type(Blog_Type blog_type){
        return blog_typeMapper.updateBlog_Type(blog_type);
    }
    public int deleteBlog_Type(int id){
        return blog_typeMapper.deleteBlog_Type(id);
    }
    public int delteBlog_Types(int[] ids){
        return blog_typeMapper.deleteBlog_Types(ids);
    }
    public int addBlog_Type(Blog_Type blog_type){
        return blog_typeMapper.addBlog_Type(blog_type);
    }
}
