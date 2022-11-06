package com.ssafy.board.model.mapper;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.attraction.model.AttractionDto;
import com.ssafy.board.model.BoardDto;
import com.ssafy.board.model.PlanDto;

@Mapper
public interface BoardMapper {

	void writeArticle(BoardDto boardDto);
	void registerPlan(BoardDto boardDto);
	List<AttractionDto> getArticleList();
	BoardDto getArticle(String id);
	ArrayList<PlanDto> getPlan(String id);

}
