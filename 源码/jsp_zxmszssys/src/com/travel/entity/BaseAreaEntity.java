package com.travel.entity;

/**
 * 统一地区库
 * 
 * @author Mark
 * @email sunlightcs@gmail.com
 * @date 2020-03-21 12:02:29
 */
public class BaseAreaEntity  {

	/**
	 * 地址ID
	 */
	private Integer baseAreaid;
	/**
	 * 地区名字
	 */
	private String name;
	/**
	 * 上级路径ID
	 */
	private Integer parentid;
	/**
	 * 顺序
	 */
	private Integer vieworder;
	public Integer getBaseAreaid() {
		return baseAreaid;
	}
	public void setBaseAreaid(Integer baseAreaid) {
		this.baseAreaid = baseAreaid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getParentid() {
		return parentid;
	}
	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}
	public Integer getVieworder() {
		return vieworder;
	}
	public void setVieworder(Integer vieworder) {
		this.vieworder = vieworder;
	}

}
