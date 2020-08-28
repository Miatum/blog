package com.miatum.blog.controller;

import com.miatum.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("/showuser/{id}")
    public String selectUser(@PathVariable int id,Model model){
        model.addAttribute("name",userService.selectUser(id).toString());
        System.out.println(userService.selectUser(id).getName());
        return "blog";
    }
}
