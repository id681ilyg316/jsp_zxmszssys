package com.travel.entity;

/**
 * 
 * 
 * @author Mark
 * @email sunlightcs@gmail.com
 * @date 2020-03-21 12:02:29
 */
public class FoodEntity {

	/**
	 * 
	 */
	private Integer fooId;
	/**
	 * 美食名称
	 */
	private String fooName;
	/**
	 * 景区ID
	 */
	private Integer sceId;
	/**
	 * 图片地址
	 */
	private String imgUrl;
	/**
	 * 地址
	 */
	private String address;
	/**
	 * 描述
	 */
	private String description;
	public Integer getFooId() {
		return fooId;
	}
	public void setFooId(Integer fooId) {
		this.fooId = fooId;
	}
	public String getFooName() {
		return fooName;
	}
	public void setFooName(String fooName) {
		this.fooName = fooName;
	}
	public Integer getSceId() {
		return sceId;
	}
	public void setSceId(Integer sceId) {
		this.sceId = sceId;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

}
