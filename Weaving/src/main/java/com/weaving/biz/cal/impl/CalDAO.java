package com.weaving.biz.cal.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weaving.biz.cal.CalVO;

@Repository
public class CalDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	public void insertCal(CalVO vo) {
		
	}

	public List<CalVO> getCalList(CalVO vo) {
		return mybatis.selectList("getCalList", vo);
	}
}
