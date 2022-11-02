package com.ssafy.attraction.model;

public class DetailDto {
	private String title;
	private String addr;
	private String overview;
	private String firstimage;
	public String getFirstimage() {
		return firstimage;
	}
	public void setFirstimg(String firstimage) {
		this.firstimage = firstimage;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getOverview() {
		return overview;
	}
	public void setOverview(String overview) {
		this.overview = overview;
	}
	@Override
	public String toString() {
		return "DetailDto [title=" + title + ", addr=" + addr + ", overview=" + overview + "]";
	}
	
}
