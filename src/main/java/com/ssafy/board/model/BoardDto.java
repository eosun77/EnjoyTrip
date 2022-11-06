package com.ssafy.board.model;

import java.util.ArrayList;
import java.util.Arrays;

public class BoardDto {
	private int articleNo;
	private int userId;
	private String userName;
	private String subject;
	private String content;
	private int hit;
	private String registerTime;
	private String firstimage;
	private ArrayList<PlanDto> planList;
	

	public String getFirstimage() {
		return firstimage;
	}

	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}

	public ArrayList<PlanDto> getPlanList() {
		return planList;
	}

	public void setPlanList(ArrayList<PlanDto> planList) {
		this.planList = planList;
	}

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}

}
