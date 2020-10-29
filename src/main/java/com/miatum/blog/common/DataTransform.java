package com.miatum.blog.common;

import com.alibaba.fastjson.JSONObject;

import java.util.List;

/**
*@Author:miatum
*@Description:数据转换方法
*@Date:8:20 2020/9/28
*/
public class DataTransform {
    public static <T> JSONObject forLayUiTable(List<T> list){
        /**
        *@Author: miatum
        *@Description: 将list按layui数据表格要求格式转JSON,使用范型可以让该方法能同时接收Blog、Blog_Tag、Blog_Type、User
        *@Date: 8:25 2020/9/28
        */
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("code",0);
        jsonObject.put("count",list.size());
        jsonObject.put("msg","");
        jsonObject.put("data",list);
        return jsonObject;
    }
}
