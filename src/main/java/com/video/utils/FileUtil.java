package com.video.utils;

import java.io.BufferedInputStream;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.sql.Blob;

import sun.misc.BASE64Decoder;

/**
 * 提供常用的关于文件的操作. 本类提供office文件以及pdf文件转string的方法。作用为搜索引擎录入文件内容.
 * 比如用户上传文件=》文件转字符串，字符串录入到solr中。
 * 
 * @author guobz
 *
 */
public class FileUtil {

	public boolean writeTxt(String filePath, String str) {
		try {
			BufferedWriter out = new BufferedWriter(new FileWriter(filePath));
			out.write(str);
			out.close();
			return true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	public static byte[] file2Bytes(String filePath) {
		byte[] buffer = null;
		try {
			File file = new File(filePath);
			FileInputStream fis = new FileInputStream(file);
			ByteArrayOutputStream bos = new ByteArrayOutputStream(1000);
			byte[] b = new byte[1000];
			int n;
			while ((n = fis.read(b)) != -1) {
				bos.write(b, 0, n);
			}
			fis.close();
			bos.close();
			buffer = bos.toByteArray();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return buffer;
	}

	public static void main(String[] args) throws IOException {
		// String str=new FileUtil().readTXT("D:/新建文本文档 (2).txt");
		/*
		 * String str=(file2Base64("C:/Users/admin/Pictures/90.jpg")); try {
		 * FileUtils.writeByteArrayToFile(new File("C:/Users/admin/Pictures/902.jpg"),
		 * base642Bytes(str)); } catch (IOException e) { // TODO Auto-generated catch
		 * block e.printStackTrace(); }
		 */
	}

	public static byte[] base642Bytes(String bytes) throws IOException {
		return new BASE64Decoder().decodeBuffer(bytes);
	}

	/**
	 * 指定位置开始写入文件
	 * 
	 * @param tempFile
	 *            输入文件
	 * @param outPath
	 *            输出文件的路径(路径+文件名)
	 * @throws IOException
	 */
	public static void randomAccessFile(String outPath, InputStream inputStream) throws IOException {
		RandomAccessFile raFile = null;
		try {
			File dirFile = new File(outPath);
			// 以读写的方式打开目标文件
			raFile = new RandomAccessFile(dirFile, "rw");
			raFile.seek(raFile.length());
			byte[] buf = new byte[1024];
			int length = 0;
			while ((length = inputStream.read(buf)) != -1) {
				raFile.write(buf, 0, length);
			}
		} catch (Exception e) {
			throw new IOException(e.getMessage());
		} finally {
			try {
				if (inputStream != null) {
					inputStream.close();
				}
				if (raFile != null) {
					raFile.close();
				}
			} catch (Exception e) {
				throw new IOException(e.getMessage());
			}
		}
	}

	public static byte[] blobToBytes(Blob blob) {
		BufferedInputStream is = null;
		try {
			is = new BufferedInputStream(blob.getBinaryStream());
			byte[] bytes = new byte[(int) blob.length()];
			int len = bytes.length;
			int offset = 0;
			int read = 0;
			while (offset < len && (read = is.read(bytes, offset, len - offset)) >= 0) {
				offset += read;
			}
			return bytes;
		} catch (Exception e) {
			return null;
		} finally {
			try {
				is.close();
			} catch (IOException e) {
				return null;
			}
		}
	}

	/**
	 * 判断文件是否存在
	 * @param path
	 * @return
	 */
	public boolean judeFileExists(String path) {
		File file = new File(path);
		if (file.exists()) {
			//System.out.println("file exists");
			return true;
		}
		return false;
	}
	
	
	// 判断文件是否存在
	public static void judeFileExists(File file) {
		if (file.exists()) {
			System.out.println("file exists");
		} else {
			System.out.println("file not exists, create it ...");
			try {
				file.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	// 判断文件夹是否存在
	public static void judeDirExists(File file) {
		if (file.exists()) {
			if (file.isDirectory()) {
				System.out.println("dir exists");
			} else {
				System.out.println("the same name file exists, can not create dir");
			}
		} else {
			System.out.println("dir not exists, create it ...");
			file.mkdir();
		}
	}
}
