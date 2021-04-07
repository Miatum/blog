package com.miatum.blog.service;

import com.miatum.blog.entity.Tag;
import com.miatum.blog.mapper.TagMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TagService {
    @Autowired
    private TagMapper tagMapper;
    public Tag selectTagById(int id) {
        return tagMapper.selectTagById(id);
    }
    public List<Tag> selectAllTag() {
        return tagMapper.selectAllTag();
    }
    public int updateTag(Tag tag) {
        return tagMapper.updateTag(tag);
    }
    public int deleteTag(int id) {
        return tagMapper.deleteTag(id);
    }
    public int deleteTags(int[] ids) {
        return tagMapper.deleteTags(ids);
    }
    public int insertTag(Tag tag) {
        return tagMapper.insertTag(tag);
    }
    public int lastInsertId() {
        return tagMapper.lastInsertId();
    }
}
