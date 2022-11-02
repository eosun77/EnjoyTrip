package com.ssafy.attraction.model;

public class SearchCondition {
	
	private String contentTypeId;
	private String areaCode;
	private String sigunguCode;
	private String attractionSearch;
	
	public String getAttractionSearch() {
		return attractionSearch;
	}
	public void setAttractionSearch(String attractionSearch) {
		this.attractionSearch = attractionSearch;
	}
	public String getContentTypeId() {
		return contentTypeId;
	}
	public void setContentTypeId(String contentTypeId) {
		this.contentTypeId = contentTypeId;
	}
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public String getSigunguCode() {
		return sigunguCode;
	}
	public void setSigunguCode(String sigunguCode) {
		this.sigunguCode = sigunguCode;
	}

}
