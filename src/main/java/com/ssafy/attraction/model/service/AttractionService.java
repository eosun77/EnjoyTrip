package com.ssafy.attraction.model.service;

import java.util.List;

import com.ssafy.attraction.model.AreaDto;
import com.ssafy.attraction.model.AttractionDto;
import com.ssafy.attraction.model.SearchCondition;
import com.ssafy.attraction.model.SigunguDto;


public interface AttractionService {

	List<AttractionDto> search(SearchCondition condition);

	AttractionDto detail(String id);

	List<AreaDto> getArea();

	List<SigunguDto> getSigungu(String areacode);
}
