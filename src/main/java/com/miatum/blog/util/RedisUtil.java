package com.miatum.blog.util;

import com.alibaba.fastjson.JSON;
import com.miatum.blog.entity.Blog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.serializer.SerializationException;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectInputStream;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

/**
 * @Description
 * @ClassName RedisUtil
 * @Author Miatum
 * @date 2021.04.12 15:43
 */
@Component
public class RedisUtil<T> {
    @Autowired
    private StringRedisTemplate redisTemplate;
    public boolean set(final String key, T value) {
        redisTemplate.getConnectionFactory().getConnection();
        try {
            redisTemplate.opsForValue().set(key, JSON.toJSONString(value));
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public T get(String key, Class<T> clazz) {
        String value = redisTemplate.boundValueOps(key).get();
        if (value == null) {
            return null;
        }
        return JSON.parseObject(value, clazz);
    }
    public Boolean del(String key) {
        return redisTemplate.delete(key);
    }
    public Long del(Collection<String> keys) {
        return redisTemplate.delete(keys);
    }
    public Boolean hasKey(String key) {
        return redisTemplate.hasKey(key);
    }
}
