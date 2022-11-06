package com.ssafy.attraction.model;

public class AttractionDto {
	
	private String addr;
	private String areacode;
	private String id;
	private String contenttypeid;
	private String firstimage;
	private String mapx;
	private String mapy;
	private String sigungucode;
	private String title;
	private String overview;
	
	public String getOverview() {
		return overview;
	}
	public void setOverview(String overview) {
		this.overview = overview;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAreacode() {
		return areacode;
	}
	public void setAreacode(String areacode) {
		this.areacode = areacode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContenttypeid() {
		return contenttypeid;
	}
	public void setContenttypeid(String contenttypeid) {
		this.contenttypeid = contenttypeid;
	}
	public String getFirstimage() {
		return firstimage;
	}
	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}
	public String getMapx() {
		return mapx;
	}
	public void setMapx(String mapx) {
		this.mapx = mapx;
	}
	public String getMapy() {
		return mapy;
	}
	public void setMapy(String mapy) {
		this.mapy = mapy;
	}
	public String getSigungucode() {
		return sigungucode;
	}
	public void setSigungucode(String sigungucode) {
		this.sigungucode = sigungucode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
}
