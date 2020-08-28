package com.miatum.blog.mapper;

import org.apache.ibatis.annotations.Select;
import com.miatum.blog.entity.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
    @Select("select * from user where id=#{id}")
    User selectUser(int id);
}
