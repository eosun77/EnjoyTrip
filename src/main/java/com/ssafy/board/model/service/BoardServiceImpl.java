package com.ssafy.board.model.service;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.attraction.model.AttractionDto;
import com.ssafy.board.model.BoardDto;
import com.ssafy.board.model.PlanDto;
import com.ssafy.board.model.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper boardMapper;

	@Override
	@Transactional
	public void writeArticle(BoardDto boardDto) {
		boardMapper.writeArticle(boardDto);
		boardMapper.registerPlan(boardDto);
	}

	@Override
	public List<AttractionDto> getArticleList() {
		return boardMapper.getArticleList();
	}

	@Override
	public BoardDto getArticle(String id) {
		ArrayList<PlanDto> planList = boardMapper.getPlan(id);
		BoardDto article = boardMapper.getArticle(id);
		article.setPlanList(planList);
		return article;
	}


}
