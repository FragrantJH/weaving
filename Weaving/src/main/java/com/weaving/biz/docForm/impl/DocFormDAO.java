package com.weaving.biz.docForm.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weaving.biz.docForm.DocFormVO;

@Repository
public class DocFormDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public void insert(DocFormVO vo) {
		System.out.println(vo);
		mybatis.insert("DocFormDAO.insertDocForm", vo);
	}
	
}
