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
		mybatis.insert("CalDAO.insertCal", vo);
	}

	public CalVO getCal(CalVO vo) {
		return mybatis.selectOne("CalDAO.getCal", vo);
	}
	
	public List<CalVO> getCalList(CalVO vo) {
		return mybatis.selectList("CalDAO.getCalList", vo);
	}
	
	public void updateCal(CalVO vo) {
		mybatis.update("CalDAO.updateCal", vo);
	}

	public void deleteCal(CalVO vo) {
		mybatis.delete("CalDAO.deleteCal", vo);
	}
}
