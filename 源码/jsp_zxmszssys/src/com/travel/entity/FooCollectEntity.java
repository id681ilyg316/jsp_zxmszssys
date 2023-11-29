package com.travel.entity;

/**
 * 这是用户收藏表
 * 
 * @author Mark
 * @email sunlightcs@gmail.com
 * @date 2020-03-21 12:02:29
 */
public class FooCollectEntity {

	/**
	 * 收藏美食主键
	 */
	private Integer colId;
	/**
	 * 美食id
	 */
	private Integer fooId;
	/**
	 * 用户账号
	 */
	private String ctel;
	public Integer getColId() {
		return colId;
	}
	public void setColId(Integer colId) {
		this.colId = colId;
	}
	public Integer getFooId() {
		return fooId;
	}
	public void setFooId(Integer fooId) {
		this.fooId = fooId;
	}
	public String getCtel() {
		return ctel;
	}
	public void setCtel(String ctel) {
		this.ctel = ctel;
	}

}
