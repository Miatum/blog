package com.miatum.blog.controller;

import com.miatum.blog.util.VideoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;

/**
 * @Description
 * @ClassName VideoController
 * @Author Miatum
 * @date 2021.03.25 12:06
 */
@Controller
@RequestMapping("/api/video")
public class VideoController {
    @Autowired
    private VideoUtil videoUtil;
    @RequestMapping("/convertToMP4")
    @ResponseBody
    public void convertToMP4() {
        String base_path = "G:\\PT\\";
        String file_name = "送你一朵小红花.4K HDR10高码.A.Little.Red.Flower.2020.WEB-DL.2160p.H265.10bits.HDR10.DDP 5.1-PTHweb.mkv";
        File file = new File(base_path + file_name);
        System.out.println(videoUtil.convertToMP4(file));
    }
}
