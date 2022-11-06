package com.ssafy.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.attraction.model.AttractionDto;
import com.ssafy.attraction.model.SearchCondition;
import com.ssafy.board.model.BoardDto;
import com.ssafy.board.model.PlanDto;
import com.ssafy.board.model.service.BoardService;
import com.ssafy.member.model.MemberDto;

@RestController
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@GetMapping("/list")
	public ModelAndView goList() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/list");
		return mv;
	}
	
	@GetMapping("/mvview/{id}")
	public ModelAndView goView(@PathVariable String id) {
		System.out.println("##################view" + id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("id", id);
		mv.setViewName("board/view");
		return mv;
	}
	
	
	
	@PostMapping("")
	public ResponseEntity<?> writeArticle(@RequestBody BoardDto boardDto,  HttpSession session) {
		try {
			MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
			boardDto.setUserId(memberDto.getId());
			System.out.println("#########" + boardDto);
			boardService.writeArticle(boardDto);
			List<AttractionDto> list = boardService.getArticleList();
			return new ResponseEntity<List<AttractionDto>>(list, HttpStatus.OK);
//			return new ResponseEntity<Integer>(cnt, HttpStatus.CREATED);
		} catch (Exception e) {
			return exceptionHandling(e);
		}

	}
	
	@GetMapping("/{id}")
	public ResponseEntity<?> getArticle(@PathVariable String id) {
		try {
			BoardDto atricle = boardService.getArticle(id);
			return new ResponseEntity<BoardDto>(atricle, HttpStatus.OK);
		} catch (Exception e) {
			return exceptionHandling(e);
		}

	}
	
	@GetMapping("")
	public ResponseEntity<?> listArticle() {
		try {
			List<AttractionDto> list = boardService.getArticleList();
			return new ResponseEntity<List<AttractionDto>>(list, HttpStatus.OK);
		} catch (Exception e) {
			return exceptionHandling(e);
		}

	}
	
	
	private ResponseEntity<String> exceptionHandling(Exception e) {
		return new ResponseEntity<String>("Error : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
