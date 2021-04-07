package com.miatum.blog.service;
import com.miatum.blog.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.miatum.blog.entity.User;
import java.util.List;
@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;
    public User selectUserByName (String name) {
        return userMapper.selectUserByName(name);
    }
    public List<User> selectAllUser () {
        return userMapper.selectAllUser();
    }
    public int updateUser (User user) {
        return userMapper.updateUser(user);
    }
    public int deleteUser (Integer id) {
        return userMapper.deleteUser(id);
    }
    public int addUser (User user) {
        return userMapper.insertUser(user);
    }
}
