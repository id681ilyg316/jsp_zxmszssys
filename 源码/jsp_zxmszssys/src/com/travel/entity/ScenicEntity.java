package com.travel.entity;

/**
 * 
 * 
 * @author Mark
 * @email sunlightcs@gmail.com
 * @date 2020-03-21 12:02:29
 */
public class ScenicEntity {

	/**
	 * 景区Id
	 */
	private Integer sceId;
	/**
	 * 景区名称
	 */
	private String sceName;
	/**
	 * 地区编号
	 */
	private String regionId;
	/**
	 * 详细地区
	 */
	private String address;
	/**
	 * 图片地址
	 */
	private String imgUrl;
	/**
	 * 描述
	 */
	private String description;
	public Integer getSceId() {
		return sceId;
	}
	public void setSceId(Integer sceId) {
		this.sceId = sceId;
	}
	public String getSceName() {
		return sceName;
	}
	public void setSceName(String sceName) {
		this.sceName = sceName;
	}
	public String getRegionId() {
		return regionId;
	}
	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}

	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

}
