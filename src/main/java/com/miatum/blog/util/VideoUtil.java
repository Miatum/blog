package com.miatum.blog.util;
import org.bytedeco.javacpp.avcodec;
import org.bytedeco.javacv.*;
import org.springframework.stereotype.Service;

import java.io.File;

@Service
public class VideoUtil {
    /**
     * @Description 如果音视频都需要转码，耗时过长
     * @Param video 视频文件, duration 视频时长
     * @return long 视频时长
     * @Author Miatum
     * @Date 2021.03.25 11:47
     **/
    public static long getVideoDuration(File video) {
        long duration = 0L;
        FFmpegFrameGrabber ff = new FFmpegFrameGrabber(video);
        try {
            ff.start();
            duration = ff.getLengthInTime() / (1000 * 1000);
            ff.stop();
        } catch (FrameGrabber.Exception e) {
            e.printStackTrace();
        }
        return duration;
    }
    /**
     * @Description 将视频文件转码成MP4格式
     * @Param file 视频文件
     * @return String 转码后MP4格式视频文件地址
     * @Author Miatum
     * @Date 2021.03.25 11:48
     **/
    public String convertToMP4(File file) {
        FFmpegFrameGrabber grabber = new FFmpegFrameGrabber(file);
        String fileName = null;
        Frame captured_frame = null;
        FFmpegFrameRecorder recorder = null;
        try {
            grabber.start();
            fileName = file.getAbsolutePath() + "_.mp4";
            recorder = new FFmpegFrameRecorder(fileName, grabber.getImageWidth(), grabber.getImageHeight(), grabber.getAudioChannels());
            recorder.setVideoCodec(avcodec.AV_CODEC_ID_H264);
            recorder.setFormat("mp4");
            recorder.setFrameRate(grabber.getFrameRate());
            recorder.setSampleRate(grabber.getSampleRate());
            recorder.setAudioChannels(grabber.getAudioChannels());
            recorder.setFrameRate(grabber.getFrameRate());
            recorder.start();
            while ((captured_frame = grabber.grabFrame()) != null) {
                try {
                    recorder.setTimestamp(grabber.getTimestamp());
                    recorder.record(captured_frame);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            recorder.stop();
            recorder.release();
            grabber.stop();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return fileName;
    }
}
