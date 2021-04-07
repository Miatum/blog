package com.miatum.blog.service;
import com.miatum.blog.entity.Blog;
import com.miatum.blog.mapper.BlogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
@Service
public class BlogService {
    @Autowired
    private BlogMapper blogMapper;
    public List<Blog> selectAllBlog() {
        return blogMapper.selectAllBlog();
    }
    public List<Blog> selectFeaturedBlog() {
        return blogMapper.selectFeaturedBlog();
    }
    public List<Blog> selectPublicBlog() {
        return blogMapper.selectPublicBlog();
    }
    public List<Blog> selectBlogByTypeId(int typeId) {
        return blogMapper.selectBlogByTypeId(typeId);
    }
    public List<Blog> selectPublicBlogByTypeId(int typeId) {
        return blogMapper.selectPublicBlogByTypeId(typeId);
    }
    public Blog selectBlogById(int id) {
        return blogMapper.selectBlogById(id);
    }
    public int updateBlog(Blog blog) {
        return blogMapper.updateBlog(blog);
    }
    public int deleteBlog(int id) {
        return blogMapper.deleteBlog(id);
    }
    public int deleteBlogs(int[] ids) {
        return blogMapper.deleteBlogs(ids);
    }
    public int insertBlog(Blog blog) {
        return blogMapper.insertBlog(blog);
    }
    public int lastInsertId() {
        return blogMapper.lastInsertId();
    }
}
