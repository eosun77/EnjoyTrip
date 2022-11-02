package com.ssafy.attraction.model.service;

import java.util.List;

import com.ssafy.attraction.model.AttractionDto;
import com.ssafy.attraction.model.DetailDto;
import com.ssafy.attraction.model.SearchCondition;


public interface AttractionService {

	List<AttractionDto> search(SearchCondition condition);

	DetailDto detail(String id);
}
