package com.ssafy.member.controller;


import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.member.model.MemberDto;
import com.ssafy.member.model.service.MemberService;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	private final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	private final MemberService memberService;
	
	@Autowired
	public MemberController(MemberService memberService) {
		super();
		this.memberService = memberService;
	}

	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@GetMapping("/pwdchange")
	public String pwdChange()
	{	
		logger.debug("pwdChange:");
		return "member/pwdchange";
	}
	
	@GetMapping("/attractionchange")
	public String attractionChange() {
//		관심장소 등록하는 지도로 이동.
		return "redirect:/";
	}
	
	@PostMapping("/modify")
	public String modify(MemberDto newInfo, HttpSession session, Model model) {
//		DB수정 및 세션가져와서 수정.
		logger.debug("newInfo : {}", newInfo);
		
		try {
//			session때문에 try,catch로 묶기
			memberService.updateMember(newInfo);

			MemberDto user = (MemberDto)session.getAttribute("userinfo");
			user.setAddr(newInfo.getAddr());
			user.setAddr2(newInfo.getAddr2());
			user.setZipCode(newInfo.getZipCode());
			session.setAttribute("userinfo", user);
		}catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
			model.addAttribute("msg", "처리중 에러 발생!!");
			return "/error/error";
		}

		
		return "redirect:/";
	}
	

	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") String id) {
		
		logger.debug("delete : {} ",id);
		try {
			memberService.deleteMember(id);
			
			return "redirect:/member/logout";
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:/index";
		
	}
	
	@PostMapping("/login")
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session, HttpServletResponse response) {
		try {
			MemberDto memberDto = memberService.loginMember(map);
			logger.debug("memberDto : {}", memberDto);
			if(memberDto != null) {
				session.setAttribute("userinfo", memberDto);
				
				Cookie cookie = new Cookie("ssafy_id", map.get("userid"));
				cookie.setPath("/board");
				if("ok".equals(map.get("saveid"))) {
					cookie.setMaxAge(60*60*24*365*40);
				} else {
					cookie.setMaxAge(0);
				}
				response.addCookie(cookie);
				return "redirect:/";
			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 다시 로그인하세요!");
				return "member/login";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제 발생!!!");
			return "error/error";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}
	
	@PostMapping("/join")
	public String join(MemberDto memberDto, Model model) {
		logger.debug("memberDto info : {}", memberDto);
		try {
			memberService.joinMember(memberDto);
			return "redirect:/member/login";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "회원 가입 중 문제 발생!!!");
			return "error/error";
		}
	}
	
	
	@GetMapping("/mypage")
	public String mypage() {
		return "member/mypage";
	}
	
	
	@GetMapping("/id/{userid}")
	@ResponseBody
	public String idCheck(@PathVariable("userid") String userId) throws Exception {
		logger.debug("idCheck userid : {}", userId);
		int cnt = memberService.idCheck(userId);
		return cnt + "";
	}
	
	@GetMapping("/name/{userName}")
	@ResponseBody
	public String nameCheck(@PathVariable("userName") String userName) throws Exception {
		logger.debug("nameCheck userName : {}", userName);
//		namecheck로 바꿀것.
		int cnt = memberService.nameCheck(userName);
		return cnt + "";
	}
	
	
	@GetMapping("/email/{userEmail}")
	@ResponseBody
	public String emailCheck(@PathVariable("userEmail") String email) throws Exception {
		logger.debug("emailCheck email : {}", email);
//		namecheck로 바꿀것.
		int cnt = memberService.emailCheck(email);
		return cnt + "";
	}
	
	
}

