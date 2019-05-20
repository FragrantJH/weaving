package com.weaving.biz.cal;

import java.util.List;

import org.springframework.stereotype.Service;

public interface CalService {
	
	void insertCal(CalVO vo);
	
	List<CalVO> getCalList(CalVO vo);
}
