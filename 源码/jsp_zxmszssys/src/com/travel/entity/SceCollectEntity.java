package com.travel.entity;

/**
 * 这是用户收藏表
 * 
 * @author Mark
 * @email sunlightcs@gmail.com
 * @date 2020-03-21 12:02:29
 */
public class SceCollectEntity {

	/**
	 * 收藏景区主键
	 */
	private Integer colId;
	/**
	 * 景点id
	 */
	private Integer sceId;
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
	public Integer getSceId() {
		return sceId;
	}
	public void setSceId(Integer sceId) {
		this.sceId = sceId;
	}
	public String getCtel() {
		return ctel;
	}
	public void setCtel(String ctel) {
		this.ctel = ctel;
	}

}
