package com.miatum.blog.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

/**
 * @Description
 * @ClassName RedisUtil
 * @Author Miatum
 * @date 2021.04.12 15:43
 */
@Component
public class RedisUtil {
    @Autowired
    @Qualifier("redisTemplate")
    private RedisTemplate redisTemplate;
    public boolean set(final String key, Object value) {
        redisTemplate.getConnectionFactory().getConnection();
        try {
            redisTemplate.opsForValue().set(key, value);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }
    public Object get(String key) {
        return key == null ? null : redisTemplate.opsForValue().get(key);
    }
}
