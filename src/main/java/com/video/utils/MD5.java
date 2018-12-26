package com.video.utils;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;


/**
 * @Author Kulen
 * @CreateTime 2010-6-16下午05:28:11
 * @Version 1.0
 * @Explanation 用MD5对数据进行加密
 */
public class MD5 {

	static final Logger log = LogManager.getLogger(MD5.class);

	MessageDigest md5;

	static final char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };

	public MD5() {
		try {
			// 获得MD5摘要算法的 MessageDigest 对象
			md5 = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			log.error("创建MD5对象出错, ", e);
			throw new IllegalArgumentException("创建md5对象时出错");
		}
	}

	public synchronized String getMD5(String s) {
		return this.getMD5(s.getBytes()).toLowerCase();
	}

	public synchronized String getMD5(byte[] btInput) {
		try {
			// 使用指定的字节更新摘要
			md5.update(btInput);
			// 获得密文
			byte[] md = md5.digest();
			// 把密文转换成十六进制的字符串形式
			int j = md.length;
			char str[] = new char[j * 2];
			int k = 0;
			for (int i = 0; i < j; i++) {
				byte byte0 = md[i];
				str[k++] = hexDigits[byte0 >>> 4 & 0xf];
				str[k++] = hexDigits[byte0 & 0xf];
			}
			return new String(str).toLowerCase();
		} catch (Exception e) {
			log.error("生成MD5码时出错,", e);
			throw new IllegalArgumentException("生成MD5出错");
		}
	}
	
	 /**
	  * 获取32位的MD5加密
	  * @param sourceStr
	  * @return
	  */
	public static String getMD5Str(String sourceStr) {
	        String result = "";
	        try {
	            MessageDigest md = MessageDigest.getInstance("MD5");
	            md.update(sourceStr.getBytes(Charset.forName("utf-8")));
	            byte b[] = md.digest();
	            int i;
	            StringBuffer buf = new StringBuffer("");
	            for (int offset = 0; offset < b.length; offset++) {
	                i = b[offset];
	                if (i < 0)
	                    i += 256;
	                if (i < 16)
	                    buf.append("0");
	                buf.append(Integer.toHexString(i));
	            }
	            result = buf.toString();
	        } catch (NoSuchAlgorithmException e) {
	            System.out.println(e);
	        }
	        return result;
   }

}
