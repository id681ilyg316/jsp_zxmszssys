package com.travel.entity;

/**
 * 这是一个客户登记表！
 * 
 * @author Mark
 * @email sunlightcs@gmail.com
 * @date 2020-03-07 19:36:48
 */
public class CllentEntity {

	/**
	 * 用户主键
	 */
	private Integer cllId;
	/**
	 * 姓名
	 */
	private String cllName;
	/**
	 * 登录账号
	 */
	private String ctel;
	/**
	 * 用户密码
	 */
	private String password;
	/**
	 * 性别
	 */
	private String csex;
	/**
	 * 年龄
	 */
	private Integer age;
	/**
	 * 身份识别码（用于找回密码）
	 */
	private String idCode;
	public Integer getCllId() {
		return cllId;
	}
	public void setCllId(Integer cllId) {
		this.cllId = cllId;
	}
	public String getCllName() {
		return cllName;
	}
	public void setCllName(String cllName) {
		this.cllName = cllName;
	}
	public String getCtel() {
		return ctel;
	}
	public void setCtel(String ctel) {
		this.ctel = ctel;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCsex() {
		return csex;
	}
	public void setCsex(String csex) {
		this.csex = csex;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getIdCode() {
		return idCode;
	}
	public void setIdCode(String idCode) {
		this.idCode = idCode;
	}


}
