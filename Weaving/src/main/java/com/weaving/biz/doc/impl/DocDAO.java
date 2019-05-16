package com.weaving.biz.doc.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weaving.biz.doc.DocVO;

@Repository
public class DocDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<DocVO> getBoardList(DocVO vo) {
		//
		return mybatis.selectList("DocDAO.getDocList", vo);
	}	
}
