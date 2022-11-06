package com.ssafy.attraction.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.attraction.model.AreaDto;
import com.ssafy.attraction.model.AttractionDto;
import com.ssafy.attraction.model.SearchCondition;
import com.ssafy.attraction.model.SigunguDto;

@Mapper
public interface AttractionMapper {
	
	List<AreaDto> getArea();

	List<AttractionDto> search(SearchCondition condition);

	AttractionDto detail(String id);

	List<SigunguDto> getSigungu(String areacode);
}
