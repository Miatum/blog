package com.miatum.blog.service;

import com.miatum.blog.entity.Blog_Tag;
import com.miatum.blog.mapper.Blog_TagMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Blog_TagService {
    @Autowired
    private Blog_TagMapper blog_tagMapper;
    public Blog_Tag selectBlog_TagById(int id){
        return blog_tagMapper.selectBlog_TagById(id);
    }
    public List<Blog_Tag> selectAllBlog_Tag(){
        return blog_tagMapper.selectAllBlog_Tag();
    }
    public int updateBlog_Tag(Blog_Tag blog_tag){
        return blog_tagMapper.updateBlog_Tag(blog_tag);
    }
    public int deleteBlog_Tag(int id){
        return blog_tagMapper.deleteBlog_Tag(id);
    }
    public int deleteBlog_Tags(int[] ids){
        return blog_tagMapper.deleteBlog_Tags(ids);
    }
    public int addBlog_Tag(Blog_Tag blog_tag){
        return blog_tagMapper.addBlog_Tag(blog_tag);
    }
}
