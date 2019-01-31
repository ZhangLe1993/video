package com.video.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;

/**
 * 流转换工具类
 * @author yule.zhang
 * 
 */
public class IOUtils {
	
	
	
	/**
	 * InputStream  转化成   ByteArrayOutputStream
	 * InputStream 适用于FileInputStream,ByteArrayInputStream,DataInputStream
	 * @param inputStream
	 */
	public static ByteArrayOutputStream inputStreamToByteArrayOutputStream(InputStream inputStream) {
		ByteArrayOutputStream byteArrayOutputStream = null;
		try {
			byteArrayOutputStream = new ByteArrayOutputStream();
			byte[] buffer = new byte[1024];
			int n;
			while ((n = inputStream.read(buffer)) != -1) {
				byteArrayOutputStream.write(buffer, 0, n);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return byteArrayOutputStream;
	}
	
	

	/**
	 * ByteArrayOutputStream  转化成   byte[]
	 * @param byteArrayOutputStream
	 * @return
	 */
	public static byte[] byteArrayOutputStreamTOByte(ByteArrayOutputStream byteArrayOutputStream) {
		byte[] bytes = null;
		try {
			bytes = byteArrayOutputStream.toByteArray();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bytes;
	}
	
	
	/**
	 * byte []  转化成    ByteArrayInputStream
	 * @param bytes
	 * @return
	 */
	public static ByteArrayInputStream byteToByteArrayInputStream(byte [] bytes) {
		ByteArrayInputStream byteArrayInputStream = null;
		try {
			byteArrayInputStream = new ByteArrayInputStream(bytes);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return byteArrayInputStream;
	}
}
