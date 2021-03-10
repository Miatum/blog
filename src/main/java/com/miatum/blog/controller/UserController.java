package com.miatum.blog.controller;
import com.miatum.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
@Controller
public class UserController {
    @Autowired
    private UserService userService;
}
