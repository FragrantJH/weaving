package com.weaving.biz.documentForm.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weaving.biz.documentForm.DocumentFormVO;

@Repository
public class DocumentFormDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public void insert(DocumentFormVO vo) {
		
	}
	
}
