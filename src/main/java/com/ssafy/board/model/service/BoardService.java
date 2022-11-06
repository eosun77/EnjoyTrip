package com.ssafy.board.model.service;

import java.util.List;

import com.ssafy.attraction.model.AttractionDto;
import com.ssafy.board.model.BoardDto;


public interface BoardService {

	void writeArticle(BoardDto boardDto);

	List<AttractionDto> getArticleList();

	BoardDto getArticle(String id);
	
}
