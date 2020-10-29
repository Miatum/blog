package com.miatum.blog.mapper;

import com.miatum.blog.entity.Blog_Type;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Blog_TypeMapper {
    @Select("select * from blog_type where id=#{id}")
    Blog_Type selectBlog_TypeById(int id);
    @Select("select * from blog_type")
    List<Blog_Type> selectAllBlog_Type();
    @Update("update blog_type set type_name=#{type_name},type_name_en=#{type_name_en} where id=#{id}")
    int updateBlog_Type(Blog_Type blog_type);
    @Delete("delete from blog_type where id=#{id}")
    int deleteBlog_Type(int id);
    @Delete({
            "<script>",
            "delete from blog_type",
            "where id in",
            "<foreach collection='ids' item='id' open='(' separator=',' close=')'>",
            "#{id}",
            "</foreach>",
            "</script>"
    })
    int deleteBlog_Types(@Param("ids") int[] ids);
    @Insert("insert into blog_type values(null,#{type_name},#{type_name_en})")
    int addBlog_Type(Blog_Type blog_type);
}
