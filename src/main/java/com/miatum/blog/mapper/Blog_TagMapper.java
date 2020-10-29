package com.miatum.blog.mapper;

import com.miatum.blog.entity.Blog_Tag;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface Blog_TagMapper {
    @Select("select * from blog_tag where id=#{id}")
    Blog_Tag selectBlog_TagById(int id);
    @Select("select * from blog_tag")
    List<Blog_Tag> selectAllBlog_Tag();
    @Update("update blog_tag set tag_name=#{tag_name} where id=#{id}")
    int updateBlog_Tag(Blog_Tag blog_tag);
    @Delete("delete from blog_tag where id=#{id}")
    int deleteBlog_Tag(int id);
    @Delete({
            "<script>",
            "delete from blog_tag",
            "where id in",
            "<foreach collection='ids' item='id' open='(' separator=',' close=')'>",
            "#{id}",
            "</foreach>",
            "</script>"
    })
    int deleteBlog_Tags(@Param("ids") int[] ids);
    @Insert("insert into blog_tag values(null,#{tag_name})")
    int addBlog_Tag(Blog_Tag blog_tag);
}
