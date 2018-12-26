package com.video.utils;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;


public class SendEmail {
	
	public static String send(String email,String otherCode)
	{
		Properties p = new Properties();
		p.put("mail.smtp.host", "smtp.sina.com");
		p.put("mail.smtp.auth", "true");
		Authenticator authenticator = new Authenticator()
		{
			@Override
			protected PasswordAuthentication getPasswordAuthentication()
			{
				return new PasswordAuthentication("zhangyule1993@sina.com","gq2014zhangyule");
			}
		};
		Session sendMailSession = Session.getDefaultInstance(p,authenticator);
		Message mailMessage = new MimeMessage(sendMailSession);
		try
		{
			System.out.println("正在发送.....");
			Address from = new InternetAddress("zhangyule1993@sina.com");
			mailMessage.setFrom(from);
			Address to = new InternetAddress(email);
			mailMessage.setRecipient(Message.RecipientType.TO, to);
			mailMessage.setSubject("【青汤网】");
			mailMessage.setText("您正在进行青汤文化影视网邮箱激活验证码校验，请勿泄露验证码 "+otherCode+"<br>验证码有效期为10分钟。");			
			try
			{
				Transport.send(mailMessage);
				System.out.println("发送成功");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			System.out.println(otherCode);
			return otherCode;
		}
		catch(Exception e)
		{
	         e.printStackTrace();
	         return null;
		}
		
	}
	public  void sendMethod(String uphone)
	{
		//(1)建立和邮件服务器的回话  
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol","smtp");//协议  
		props.setProperty("mail.smtp.host","smtp.sina.com");//主机名  
		props.setProperty("mail.smtp.auth","true");//是否开启权限控制  
		props.setProperty("mail.debug","true");//是否打印发送时的信息  
		Session session = Session.getInstance(props);
		
		//2)创建邮件  
		Message msg = new MimeMessage(session);
		try
		{
			msg.setFrom(new InternetAddress("zhangyule1993@sina.com"));
		    msg.setSubject("这是一封来自java的邮件");//标题  
		    msg.setText("你好，点击如下连接激活帐号，如果不能点击请复制连接到浏览器地址栏访问：http://127.0.0.1:8080/webchat/SendEmailServlet?uphone=");
		    msg.setRecipient(RecipientType.TO,new InternetAddress(uphone));//收件人  
		
		    //3）发送邮件
		    Transport trans = session.getTransport();
		    trans.connect("zhangyule1993@sina.com","gq1993zhangyule");//发件人的用户名和密码  
		    trans.sendMessage(msg, msg.getAllRecipients());
		}
		catch(MessagingException e)
		{
			e.printStackTrace();
		}
		//发件人邮箱
	}
	/*public static void main(String[] args) 
	{
		SendEmail.send("1591022347@qq.com");
		SendEmail.send("1032089468@qq.com");
	}*/

}
