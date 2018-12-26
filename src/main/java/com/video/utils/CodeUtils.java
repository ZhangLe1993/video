package com.video.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class CodeUtils {

	public static boolean executeCodecs(String ffmpegPath, String upFilePath, String codcFilePath, String mediaPicPath)
			throws Exception {
		// 创建一个List集合来保存转换视频文件为flv格式的命令
        List<String> convert = new ArrayList<String>();
        convert.add(ffmpegPath); // 添加转换工具路径
        convert.add("-i"); // 添加参数＂-i＂，该参数指定要转换的文件
        convert.add(upFilePath); // 添加要转换格式的视频文件的路径
        convert.add("-qscale");     //指定转换的质量
        convert.add("6");
        convert.add("-ab");        //设置音频码率
        convert.add("64");
        convert.add("-ac");        //设置声道数
        convert.add("2");
        convert.add("-ar");        //设置声音的采样频率
        convert.add("22050");
        convert.add("-r");        //设置帧频
        convert.add("24");
        convert.add("-y"); // 添加参数＂-y＂，该参数指定将覆盖已存在的文件
        convert.add(codcFilePath);

        // 创建一个List集合来保存从视频中截取图片的命令
        List<String> cutpic = new ArrayList<String>();
        cutpic.add(ffmpegPath);
        cutpic.add("-i");
        cutpic.add(upFilePath); // 同上（指定的文件即可以是转换为flv格式之前的文件，也可以是转换的flv文件）
        cutpic.add("-y");
        cutpic.add("-f");
        cutpic.add("image2");
        cutpic.add("-ss"); // 添加参数＂-ss＂，该参数指定截取的起始时间
        cutpic.add("17"); // 添加起始时间为第17秒
        //cutpic.add("-t"); // 添加参数＂-t＂，该参数指定持续时间
        //cutpic.add("0.001"); // 添加持续时间为1毫秒
        cutpic.add("-vframes");    
        cutpic.add("4");//帧数为4
        cutpic.add("-s"); // 添加参数＂-s＂，该参数指定截取的图片大小
        cutpic.add("800*280"); // 添加截取的图片大小为350*240
        cutpic.add(mediaPicPath); // 添加截取的图片的保存路径

        boolean mark = true;
        ProcessBuilder builder = new ProcessBuilder();
        try {
            builder.command(convert);
            builder.redirectErrorStream(true);
            builder.start();
            
            builder.command(cutpic);
            builder.redirectErrorStream(true);
            // 如果此属性为 true，则任何由通过此对象的 start() 方法启动的后续子进程生成的错误输出都将与标准输出合并，
            //因此两者均可使用 Process.getInputStream() 方法读取。这使得关联错误消息和相应的输出变得更容易
            builder.start();
        } catch (Exception e) {
            mark = false;
            System.out.println(e);
            e.printStackTrace();
        }
        return mark;
	}
	
	/**
	 * 只截图，不转码
	 * @param ffmpegPath
	 * @param upFilePath
	 * @param codcFilePath
	 * @param mediaPicPath
	 * @return
	 * @throws Exception
	 */
	public static boolean executeCodecs2(String ffmpegPath, String upFilePath,String mediaPicPath)
			throws Exception {
        // 创建一个List集合来保存从视频中截取图片的命令
        List<String> cutpic = new ArrayList<String>();
        cutpic.add(ffmpegPath);
        cutpic.add("-i");
        cutpic.add(upFilePath); // 同上（指定的文件即可以是转换为flv格式之前的文件，也可以是转换的flv文件）
        cutpic.add("-y");
        cutpic.add("-f");
        cutpic.add("image2");
        cutpic.add("-ss"); // 添加参数＂-ss＂，该参数指定截取的起始时间
        cutpic.add("17"); // 添加起始时间为第17秒
        //cutpic.add("-t"); // 添加参数＂-t＂，该参数指定持续时间
        //cutpic.add("0.001"); // 添加持续时间为1毫秒
        cutpic.add("-vframes");    
        cutpic.add("4");//帧数为4
        cutpic.add("-s"); // 添加参数＂-s＂，该参数指定截取的图片大小
        cutpic.add("800*280"); // 添加截取的图片大小为350*240
        cutpic.add(mediaPicPath); // 添加截取的图片的保存路径

        boolean mark = true;
        ProcessBuilder builder = new ProcessBuilder();
        try {
            builder.command(cutpic);
            builder.redirectErrorStream(true);
            builder.start();
        } catch (Exception e) {
            mark = false;
            System.out.println(e);
            e.printStackTrace();
        }
        return mark;
	}
	
	
	// 对ffmpeg无法解析的文件格式(wmv9，rm，rmvb等), 可以先用别的工具（mencoder）转换为avi(ffmpeg能解析的)格式.
    private static String processAVI(String ffmpegPath,String inputPath,String outputPath,int type) {
        List<String> commend = new ArrayList<String>();
        commend.add(ffmpegPath + "mencoder");
        commend.add(inputPath);
        commend.add("-oac");
        commend.add("lavc");
        commend.add("-lavcopts");
        commend.add("acodec=mp3:abitrate=64");
        commend.add("-ovc");
        commend.add("xvid");
        commend.add("-xvidencopts");
        commend.add("bitrate=600");
        commend.add("-of");
        commend.add("mp4");
        commend.add("-o");
        commend.add(outputPath + "a.AVI");
        try {
            ProcessBuilder builder = new ProcessBuilder();
            Process process = builder.command(commend).redirectErrorStream(true).start();
            //new PrintStream(process.getInputStream());
            //new PrintStream(process.getErrorStream());
            process.waitFor();
            return outputPath + "a.AVI";
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

 // ffmpeg能解析的格式：（asx，asf，mpg，wmv，3gp，mp4，mov，avi，flv等）
    private static boolean processFlv(String ffmpegPath,String inputPath,String outputPath,String oldfilepath) {

        if (!checkfile(inputPath)) {
            System.out.println(oldfilepath + " is not file");
            return false;
        }
        List<String> command = new ArrayList<String>();
        command.add(ffmpegPath);
        command.add("-i");
        command.add(oldfilepath);
        command.add("-ab");
        command.add("56");
        command.add("-ar");
        command.add("22050");
        command.add("-qscale");
        command.add("8");
        command.add("-r");
        command.add("15");
        command.add("-s");
        command.add("600x500");
        command.add(outputPath + "a.flv");
        try {

            // 方案1
//            Process videoProcess = Runtime.getRuntime().exec(ffmpegPath + "ffmpeg -i " + oldfilepath 
//                    + " -ab 56 -ar 22050 -qscale 8 -r 15 -s 600x500 "
//                    + outputPath + "a.flv");

            // 方案2
            Process videoProcess = new ProcessBuilder(command).redirectErrorStream(true).start();

            //new PrintStream(videoProcess.getErrorStream()).start();

            //new PrintStream(videoProcess.getInputStream()).start();

            videoProcess.waitFor();

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    
    private static boolean processMp4(String ffmpegPath,String inputPath,String outputPath,String oldfilepath) {

        if (!checkfile(inputPath)) {
            System.out.println(oldfilepath + " is not file");
            return false;
        }
        List<String> command = new ArrayList<String>();
        command.add(ffmpegPath);
        command.add("-i");
        command.add(oldfilepath);
        command.add("-c:v");
        command.add("libx264");
        command.add("-mbd");
        command.add("0");
        command.add("-c:a");
        command.add("aac");
        command.add("-strict");
        command.add("-2");
        command.add("-pix_fmt");
        command.add("yuv420p");
        command.add("-movflags");
        command.add("faststart");
        command.add(outputPath + "a.mp4");
        try {

            // 方案1
//            Process videoProcess = Runtime.getRuntime().exec(ffmpegPath + "ffmpeg -i " + oldfilepath 
//                    + " -ab 56 -ar 22050 -qscale 8 -r 15 -s 600x500 "
//                    + outputPath + "a.flv");

            // 方案2
            Process videoProcess = new ProcessBuilder(command).redirectErrorStream(true).start();

            //new PrintStream(videoProcess.getErrorStream()).start();

            //new PrintStream(videoProcess.getInputStream()).start();

            videoProcess.waitFor();

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    
    private static boolean processTs(String ffmpegPath,String inputPath,String outputPath) {
        if (!checkfile(inputPath)) {
            System.out.println(inputPath + " is not file");
            return false;
        }
        List<String> command = new ArrayList<String>();
        command.add(ffmpegPath);
        //command.add("ffmpeg");
        command.add("-qscale");     //指定转换的质量
        command.add("6");
        command.add("-ab");        //设置音频码率
        command.add("64");
        command.add("-ac");        //设置声道数
        command.add("2");
        command.add("-ar");        //设置声音的采样频率
        command.add("22050");
        command.add("-r");        //设置帧频
        command.add("24");
        command.add("-y");
        command.add("-i");
        command.add(inputPath);
        
        //command.add("-y");
        command.add("-vcodec");
        command.add("copy");
        command.add("-acodec");
        command.add("copy");
        command.add("-vbsf");
        command.add("h264_mp4toannexb");
        command.add(outputPath + File.separator+"b.ts");
        
        boolean mark = true;
        ProcessBuilder builder = new ProcessBuilder();
        try {
        	builder.command(command);
            builder.redirectErrorStream(true);
            builder.start();
        } catch (Exception e) {
        	mark = false;
            e.printStackTrace();
        }
        return mark;
    }
  
    private static boolean processM3u8(String ffmpegPath,String inputPath,String outputPath) {
        if (!checkfile(inputPath)) {
            System.out.println(inputPath + " is not file");
            return false;
        }
        List<String> command = new ArrayList<String>();
        command.add(ffmpegPath);
        //command.add("-y");
        command.add("-i");
        command.add(inputPath);
        /*command.add("-qscale");     //指定转换的质量
        command.add("6");
        command.add("-ab");        //设置音频码率
        command.add("64");
        command.add("-ac");        //设置声道数
        command.add("2");
        command.add("-ar");        //设置声音的采样频率
        command.add("22050");
        command.add("-r");        //设置帧频
        command.add("24");*/
        //command.add("-y");
        command.add("-c");
        command.add("copy");
        command.add("-map");
        command.add("0");
        command.add("-f");
        command.add("segment");
        command.add("-segment_list");
        command.add(outputPath + File.separator+"test.m3u8");
        command.add("-segment_time");
        command.add("10");
        command.add(outputPath + File.separator+"test-%03d.ts");
        //command.add("h264_mp4toannexb");
        //command.add(outputPath + File.separator+"test.ts");
        
        boolean mark = true;
        ProcessBuilder builder = new ProcessBuilder();
        try {
        	builder.command(command);
            builder.redirectErrorStream(true);
            builder.start();
        } catch (Exception e) {
        	mark = false;
            e.printStackTrace();
        }
        return mark;
    }
  
    
    private static boolean checkfile(String path) {
        File file = new File(path);
        if (!file.isFile()) {
            return false;
        }
        return true;
    }
	
    
    public static void main(String[] args) {
    	String ffmpegPath = "C:\\Workspace\\ffmpeg\\ffmpeg.exe";
    	//String inputPath = "C:\\Users\\zhang\\Desktop\\古风MV\\708bd29597d0c4d3718079d43a47b1c2.mp4";
    	String outputPath = "C:\\Users\\zhang\\Desktop\\output";
    	String inputPath = "C:\\Users\\zhang\\Desktop\\output\\b.ts";
    	ConvertVedio.getOutputPath(outputPath+File.separator+"708bd29597d0c4d3718079d43a47b1c2.mp4");
    	//processTs(ffmpegPath,inputPath,outputPath);
    	processM3u8(ffmpegPath,inputPath,outputPath);
    	/*try {
			FfmpegUtil.ffmpeg(ffmpegPath, inputPath, outputPath);
		} catch (FFmpegException e) {
			e.printStackTrace();
		}*/
	}
}
