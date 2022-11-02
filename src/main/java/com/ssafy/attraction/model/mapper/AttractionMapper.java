package com.ssafy.attraction.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.attraction.model.AttractionDto;
import com.ssafy.attraction.model.DetailDto;
import com.ssafy.attraction.model.SearchCondition;

@Mapper
public interface AttractionMapper {
	
	List<AttractionDto> search(SearchCondition condition);

	DetailDto detail(String id);
}
