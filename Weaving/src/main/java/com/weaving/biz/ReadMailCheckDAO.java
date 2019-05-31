package com.weaving.biz;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReadMailCheckDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public int getUnReadMailCount (int empNo) {
		return mybatis.selectOne("EmailDAO.mailReadCheck",empNo);
	}
}
