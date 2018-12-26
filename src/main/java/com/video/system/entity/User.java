package com.video.system.entity;

public class User {
	private String uid;
	private String username;
	private String loginname;
	private String usex;
	private Integer age;
	private String password;
	
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String uid,String loginName,String password) {
		this.uid = uid;
		this.loginname = loginName;
		this.password = password;
	}
	
	public User(String loginname, String password) {
		super();
		this.loginname = loginname;
		this.password = password;
	}
	
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	
	public String getUsex() {
		return usex;
	}
	public void setUsex(String usex) {
		this.usex = usex;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public boolean equals(Object object) {
		if(this==object) {
			return true;
		}
		if(object==null) {
			return false;
		}
		if(object instanceof User){
            User user=(User)object;
            if(user.uid.equals(this.uid)){
                return true;
            }else{
                return false;
            }
        }
        return false;
	}
}
