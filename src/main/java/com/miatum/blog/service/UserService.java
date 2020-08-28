package com.miatum.blog.service;

import com.miatum.blog.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.miatum.blog.entity.User;

@Service
public class UserService {
    @Autowired
    public UserMapper userMapper;
    public User selectUser(int id){
        return userMapper.selectUser(id);
    }
}
