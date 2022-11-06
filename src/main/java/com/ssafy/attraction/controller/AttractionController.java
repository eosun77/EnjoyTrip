package com.ssafy.attraction.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.attraction.model.AreaDto;
import com.ssafy.attraction.model.AttractionDto;
import com.ssafy.attraction.model.SearchCondition;
import com.ssafy.attraction.model.SigunguDto;
import com.ssafy.attraction.model.service.AttractionService;

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
	
	@GetMapping("/area")
	public ResponseEntity<?> getArea() {
		try {
			System.out.println("여기는 도시 ####################################");
			List<AreaDto> list = attractionService.getArea();
			if(list != null && !list.isEmpty()) {
				System.out.println(list);
				return new ResponseEntity<List<AreaDto>>(list, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return exceptionHandling(e);
		}
	}
	
	@GetMapping("/area/{areacode}")
	public ResponseEntity<?> getSigungu(@PathVariable String areacode) {
		System.out.println("여기는 시군구 ####################################");
		try {
			List<SigunguDto> list = attractionService.getSigungu(areacode);
			if(list != null && !list.isEmpty()) {
				System.out.println(list);
				return new ResponseEntity<List<SigunguDto>>(list, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return exceptionHandling(e);
		}
	}
	
	@GetMapping("/plan")
	public ResponseEntity<?> search(@ModelAttribute SearchCondition condition) {
		try {
			List<AttractionDto> list = attractionService.search(condition);
			System.out.println(list);
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
			AttractionDto detail = new AttractionDto();
			System.out.println(id);
			detail = attractionService.detail(id);
			System.out.println("DETAIL = " + detail);
			if(detail != null) {
				return new ResponseEntity<AttractionDto>(detail, HttpStatus.OK);
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

