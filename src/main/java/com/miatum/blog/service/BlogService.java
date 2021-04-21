package com.miatum.blog.service;
import com.miatum.blog.entity.Blog;
import com.miatum.blog.mapper.BlogMapper;
import com.miatum.blog.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
@Service
public class BlogService {
    @Autowired
    private BlogMapper blogMapper;
    @Autowired
    @Resource
    private RedisUtil redisUtil;
    public List<Blog> selectAllBlog() {
        List<Blog> blogs = new ArrayList<Blog>();
        blogs = (List<Blog>) redisUtil.get("AllBlog", List.class);
        if (blogs == null) {
            blogs = blogMapper.selectAllBlog();
            redisUtil.set("AllBlog", blogs);
            System.out.println("from db");
        } else {
            System.out.println("from redis");
        }
        return blogs;
    }
    public List<Blog> selectFeaturedBlog() {
        List<Blog> blogs = new ArrayList<Blog>();
        blogs = (List<Blog>) redisUtil.get("FeaturedBlog", List.class);
        if (blogs == null) {
            blogs = blogMapper.selectFeaturedBlog();
            redisUtil.set("FeaturedBlog", blogs);
            System.out.println("from db");
        } else {
            System.out.println("from redis");
        }
        return blogs;
    }
    public List<Blog> selectPublicBlog() {
        List<Blog> blogs = new ArrayList<Blog>();
        blogs = (List<Blog>) redisUtil.get("PublicBlog", List.class);
        if (blogs == null) {
            blogs = blogMapper.selectPublicBlog();
            redisUtil.set("PublicBlog", blogs);
            System.out.println("from db");
        } else {
            System.out.println("from redis");
        }
        return blogs;
    }
    public List<Blog> selectBlogByTypeId(int typeId) {
        List<Blog> blogs = new ArrayList<Blog>();
        blogs = (List<Blog>) redisUtil.get("TypeBlog_" + typeId, List.class);
        if (blogs == null) {
            blogs = blogMapper.selectBlogByTypeId(typeId);
            redisUtil.set("TypeBlog_" + typeId, blogs);
            System.out.println("from db");
        } else {
            System.out.println("from redis");
        }
        return blogs;
    }
    public List<Blog> selectPublicBlogByTypeId(int typeId) {
        List<Blog> blogs = new ArrayList<Blog>();
        blogs = (List<Blog>) redisUtil.get("PublicTypeBlog_" + typeId, List.class);
        if (blogs == null) {
            blogs = blogMapper.selectPublicBlogByTypeId(typeId);
            redisUtil.set("PublicTypeBlog_" + typeId, blogs);
            System.out.println("from db");
        } else {
            System.out.println("from redis");
        }
        return blogs;
    }
    public Blog selectBlogById(int id) {
        Blog blog = (Blog) redisUtil.get("blog_" + id, Blog.class);
        if (blog == null) {
            blog = blogMapper.selectBlogById(id);
            redisUtil.set("blog_" + id, blog);
            System.out.println("from db");
        } else {
            System.out.println("from redis");
        }
        return blog;
    }
    public int updateBlog(Blog blog) {
        int result = blogMapper.updateBlog(blog);
        if (result == 1) {
            redisUtil.set("blog_" + blog.getId(), blog);
        }
        return result;
    }
    public int deleteBlog(int id) {
        int result = blogMapper.deleteBlog(id);
        if (result == 1) {
            redisUtil.del("blog_" + id);
        }
        return result;
    }
    public int deleteBlogs(int[] ids) {
        int result = blogMapper.deleteBlogs(ids);
        if (result == ids.length) {
            redisUtil.del(List.of(ids));
        }
        return result;
    }
    public int insertBlog(Blog blog) {
        int result = blogMapper.insertBlog(blog);
        if (result == 1) {
            redisUtil.set("blog_" + blog.getId(), blog);
        }
        return result;
    }
    public int lastInsertId() {
        return blogMapper.lastInsertId();
    }
}
