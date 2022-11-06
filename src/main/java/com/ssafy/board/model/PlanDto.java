package com.ssafy.board.model;

import com.ssafy.attraction.model.AttractionDto;

public class PlanDto extends AttractionDto {

	private int plan_no;
	private int order;
	private String memo;
	private String email;
	private String contentid;
	private String article_no;
	
	public int getPlan_no() {
		return plan_no;
	}
	public void setPlan_no(int plan_no) {
		this.plan_no = plan_no;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContentid() {
		return contentid;
	}
	public void setContentid(String contentid) {
		this.contentid = contentid;
	}
	public String getArticle_no() {
		return article_no;
	}
	public void setArticle_no(String article_no) {
		this.article_no = article_no;
	}
}
