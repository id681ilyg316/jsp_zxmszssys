package com.travel.entity;
public class UsersEntity {
	/**
	 * 用户名
	 */
	private String uname;
	/**
	 * 密码
	 */
	private String password;
	/**
	 * 用户类型
	 */
	private Integer utype;
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getUtype() {
		return utype;
	}
	public void setUtype(Integer utype) {
		this.utype = utype;
	}
	public UsersEntity(String uname, String password, Integer utype) {
		super();
		this.uname = uname;
		this.password = password;
		this.utype = utype;
	}
	public UsersEntity() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "UsersEntity [uname=" + uname + ", password=" + password + ", utype=" + utype + "]";
	}

}
