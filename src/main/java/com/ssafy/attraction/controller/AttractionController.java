package com.ssafy.attraction.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.attraction.model.AttractionDto;
import com.ssafy.attraction.model.DetailDto;
import com.ssafy.attraction.model.SearchCondition;
import com.ssafy.attraction.model.service.AttractionService;
import com.ssafy.member.model.MemberDto;
import com.ssafy.member.model.service.MemberService;

import io.swagger.annotations.Api;


@RestController
@RequestMapping("/attraction")
@Api("관광지정보 API")
public class AttractionController {
	
	private final Logger logger = LoggerFactory.getLogger(AttractionController.class);
	
	private final AttractionService attractionService;

	@Autowired
	public AttractionController(AttractionService attractionService) {
		super();
		this.attractionService = attractionService;
	}

	@GetMapping("")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("attraction/main");
		return mv;
	}
	
	@GetMapping("/plan")
	public ResponseEntity<?> search(@ModelAttribute SearchCondition condition) {
		try {
			List<AttractionDto> list = attractionService.search(condition);
			if(list != null && !list.isEmpty()) {
				System.out.println(list);
				return new ResponseEntity<List<AttractionDto>>(list, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return exceptionHandling(e);
		}
	}
	
	@GetMapping("/plan/{id}")
	public ResponseEntity<?> view(@PathVariable String id) {
		try {
			DetailDto detail = new DetailDto();
			detail = attractionService.detail(id);
			System.out.println("DETAIL = " + detail);
			if(detail != null) {
				return new ResponseEntity<DetailDto>(detail, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return exceptionHandling(e);
		}
	}
	
	private ResponseEntity<String> exceptionHandling(Exception e) {
		return new ResponseEntity<String>("Error : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}

}

