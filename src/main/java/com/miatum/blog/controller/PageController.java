package com.miatum.blog.controller;

import com.miatum.blog.entity.Blog;
import com.miatum.blog.entity.Blog_Tag;
import com.miatum.blog.entity.Blog_Type;
import com.miatum.blog.service.BlogService;
import com.miatum.blog.service.Blog_TagService;
import com.miatum.blog.service.Blog_TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class PageController {
    @Autowired
    private BlogService blogService;
    @Autowired
    private Blog_TypeService blog_typeService;
    @Autowired
    private Blog_TagService blog_tagService;
    @RequestMapping("/")
    public String exploreBlog(Model model){
        List<Blog_Type> blog_types=blog_typeService.selectAllBlog_Type();
        model.addAttribute("blog_types",blog_types);
        List<Blog> blogs=blogService.selectAllBlog();
        model.addAttribute("blogs",blogs);
        return "exploreBlog";
    }
    @RequestMapping("/manageBlog")
    public String blogManage(){
        return "manageBlog";
    }
    @RequestMapping("/manageBlogType")
    public String blogTypeManage(){
        return "manageBlogType";
    }
    @RequestMapping("/manageBlogTag")
    public String blogTagManage(){
        return "manageBlogTag";
    }
    @RequestMapping("/manageUser")
    public String userManage(){
        return "manageUser";
    }
    @RequestMapping("/editBlog/{id}")
    public String blogEdit(@PathVariable(value = "id") int id, Model model){
        Blog blog = blogService.selectBlogById(id);
        model.addAttribute("blog" , blog);
        List<Blog_Type> blog_types = blog_typeService.selectAllBlog_Type();
        List<Blog_Tag> blog_tags = blog_tagService.selectAllBlog_Tag();
        model.addAttribute("blog_types",blog_types);
        model.addAttribute("blog_tags",blog_tags);
        return "editBlog";
    }
    @RequestMapping("/addBlog")
    public String addBlog(Model model){
        List<Blog_Type> blog_types = blog_typeService.selectAllBlog_Type();
        List<Blog_Tag> blog_tags = blog_tagService.selectAllBlog_Tag();
        model.addAttribute("blog_types",blog_types);
        model.addAttribute("blog_tags",blog_tags);
        return "addBlog";
    }
    @RequestMapping("/exploreBlog/{id}")
    public String exploreSingleBlog(@PathVariable(value = "id") int id,Model model){
        Blog blog = blogService.selectBlogById(id);
        List<Blog_Type> blog_types = blog_typeService.selectAllBlog_Type();
        model.addAttribute("blog_types",blog_types);
        model.addAttribute("blog",blog);
        return "exploreSingleBlog";
    }
}
