package com.ssafy.member.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "MemberDto (회원정보)", description = "아이디, 비번, 이름.을 가진   Domain Class")
public class MemberDto {

	@ApiModelProperty(value = "회원아이디")
	private String userId;
	@ApiModelProperty(value = "회원이름")
	private String userName;
	@ApiModelProperty(value = "회원비밀번호")
	private String userPwd;

	@ApiModelProperty(value = "가입일")
	private String joinDate;


	@ApiModelProperty(value = "이메일")
	private String email;
	
	@ApiModelProperty(value = "기본주소")
	private String addr;
	
	@ApiModelProperty(value = "상세주소")
	private String addr2;
	
	@ApiModelProperty(value = "우편번호")
	private String zipCode;
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@ApiModelProperty(value = "아이디번호")
	private String id;
	
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}



	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	@Override
	public String toString() {
		return "MemberDto [userId=" + userId + ", userName=" + userName + ", userPwd=" + userPwd + ", joinDate="
				+ joinDate + ", email=" + email + ", addr=" + addr + ", addr2=" + addr2 + ", zipCode=" + zipCode
				+ ", id=" + id + "]";
	}

	

}
