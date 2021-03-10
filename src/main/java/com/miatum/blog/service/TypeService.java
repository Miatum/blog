package com.miatum.blog.service;

import com.miatum.blog.entity.Type;
import com.miatum.blog.mapper.TypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeService {
    @Autowired
    private TypeMapper typeMapper;
    public Type selectTypeById (int id) {
        return typeMapper.selectTypeById(id);
    }
    public List<Type> selectAllType () {
        return typeMapper.selectAllType();
    }
    public int updateType (Type type) {
        return typeMapper.updateType(type);
    }
    public int deleteType (int id) {
        return typeMapper.deleteType(id);
    }
    public int deleteTypes (int[] ids) {
        return typeMapper.deleteTypes(ids);
    }
    public int insertType (Type type) {
        return typeMapper.insertType(type);
    }
    public int lastInsertId () {
        return typeMapper.lastInsertId();
    }
}
