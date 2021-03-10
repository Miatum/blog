package com.miatum.blog.mapper;
import com.miatum.blog.entity.Blog;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import java.util.List;
@Repository
public interface BlogMapper {
    // 查询所有博客
    @Select("select blog.*, type.type_name, tag.tag_name from blog \n" +
            "left join type on blog.type_id = type.id\n" +
            "left join tag on blog.tag_id = tag.id")
    List<Blog> selectAllBlog();
    // 传入分类ID查询博客
    @Select("select blog.*, type.type_name, tag.tag_name from blog \n" +
            "left join type on blog.type_id = type.id\n" +
            "left join tag on blog.tag_id = tag.id\n" +
            "where blog.type_id = #{typeId}")
    List<Blog> selectBlogByTypeId(int typeId);
    // 传入博客ID查询博客
    @Select("select blog.*, type.type_name, tag.tag_name from blog \n" +
            "left join type on blog.type_id = type.id\n" +
            "left join tag on blog.tag_id = tag.id\n" +
            "where blog.id = #{id}")
    Blog selectBlogById (int id);
    // 更新博客
    @Update("update blog set title = #{title},intro = #{intro},cover = #{cover},type_id = #{type_id},tag_id = #{tag_id},author = #{author},date = #{date},content = #{content} where id = #{id}")
    int updateBlog (Blog blog);
    // 传入ID删除博客
    @Delete("delete from blog where id=#{id}")
    int deleteBlog(int id);
    // 传入ID批量删除博客
    @Delete({
            "<script>",
            "delete from blog",
            "where id in",
            "<foreach collection='ids' item='id' open='(' separator=',' close=')'>",
            "#{id}",
            "</foreach>",
            "</script>"
    })
    int deleteBlogs (@Param("ids") int[] ids);
    //  新增博客
    @Insert("insert into blog values(null, #{title}, #{intro}, #{cover}, #{type_id}, #{tag_id}, #{author}, #{date}, #{content})")
    int insertBlog(Blog blog);
    //  LAST_INSERT_ID ()
    @Select("select LAST_INSERT_ID()")
    int lastInsertId ();
}
