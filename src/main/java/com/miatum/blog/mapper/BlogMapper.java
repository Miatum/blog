package com.miatum.blog.mapper;

import com.miatum.blog.entity.Blog;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface BlogMapper {
    @Select("select blog.*,blog_type.type_name,blog_tag.tag_name from blog \n" +
            "left join blog_type on blog.type_id=blog_type.id\n" +
            "left join blog_tag on blog.tag_id=blog_tag.id")
    List<Blog> selectAllBlog();
    @Select("select blog.*,blog_type.type_name,blog_tag.tag_name from blog \n" +
            "left join blog_type on blog.type_id=blog_type.id\n" +
            "left join blog_tag on blog.tag_id=blog_tag.id\n" +
            "where blog.id=#{id}")
    Blog selectBlogById(int id);
    @Update("update blog set title=#{title},intro=#{intro},cover=#{cover},type_id=#{type_id},tag_id=#{tag_id},author=#{author},date=#{date},content=#{content} where id=#{id}")
    int updateBlog(Blog blog);
    @Delete("delete from blog where id=#{id}")
    int deleteBlog(int id);
    @Delete({
            "<script>",
            "delete from blog",
            "where id in",
            "<foreach collection='ids' item='id' open='(' separator=',' close=')'>",
            "#{id}",
            "</foreach>",
            "</script>"
    })
    int deleteBlogs(@Param("ids") int[] ids);
    @Insert("insert into blog values(null,#{title},#{intro},#{cover},#{type_id},#{tag_id},#{author},#{date},#{content})")
    int insertBlog(Blog blog);
}
