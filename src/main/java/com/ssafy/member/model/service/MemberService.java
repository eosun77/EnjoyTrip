package com.ssafy.member.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.member.model.MemberDto;

public interface MemberService {

	int idCheck(String userId) throws Exception;
	int nameCheck(String userName) throws SQLException;
	int emailCheck(String userEmail) throws SQLException;
	
	void joinMember(MemberDto memberDto) throws Exception;
	MemberDto loginMember(Map<String, String> map) throws Exception;
	
	/* Admin */
	List<MemberDto> listMember(Map<String, Object> map) throws Exception;
	MemberDto getMember(String userId) throws Exception;
	void updateMember(MemberDto memberDto) throws Exception;
	void deleteMember(String userid) throws Exception;
	String findPassword(String userId);
	List<String> backGround();
	
}
