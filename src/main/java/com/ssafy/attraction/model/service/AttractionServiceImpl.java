package com.ssafy.attraction.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.attraction.model.AreaDto;
import com.ssafy.attraction.model.AttractionDto;
import com.ssafy.attraction.model.SearchCondition;
import com.ssafy.attraction.model.SigunguDto;
import com.ssafy.attraction.model.mapper.AttractionMapper;

@Service
public class AttractionServiceImpl implements AttractionService {

	private AttractionMapper attractionMapper;
	
	@Autowired
	public AttractionServiceImpl(AttractionMapper attractionMapper) {
		super();
		this.attractionMapper = attractionMapper;
	}

	@Override
	public List<AttractionDto> search(SearchCondition condition) {
		return attractionMapper.search(condition);
	}

	@Override
	public AttractionDto detail(String id) {
		return attractionMapper.detail(id);
	}

	@Override
	public List<AreaDto> getArea() {
		return attractionMapper.getArea();
	}

	@Override
	public List<SigunguDto> getSigungu(String areacode) {
		return attractionMapper.getSigungu(areacode);
	}

}
