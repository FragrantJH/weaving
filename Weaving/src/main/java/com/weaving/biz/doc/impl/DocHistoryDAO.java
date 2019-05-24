package com.weaving.biz.doc.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weaving.biz.doc.DocHistoryVO;

@Repository
public class DocHistoryDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public void insertDocHistory(DocHistoryVO vo) {
		mybatis.insert("DocHistoryDAO.insertDocHistory", vo);
	}
}
