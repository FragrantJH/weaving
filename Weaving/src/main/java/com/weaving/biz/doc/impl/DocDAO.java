package com.weaving.biz.doc.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weaving.biz.doc.DocVO_;

@Repository
public class DocDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public void insertDoc(DocVO_ vo) {
		mybatis.insert("DocDAO.insertDoc", vo);
	}
	
	public void insertDocDetail(DocVO_ vo) {
		mybatis.insert("DocDAO.insertDocDeatil", vo);
	}
	
	public List<DocVO_> getBoardList(DocVO_ vo) {
		//
		return mybatis.selectList("DocDAO.getDocList", vo);
	}

	public List<DocVO_> getDocWaitList(DocVO_ vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("DocDAO.getDocWaitList", vo);
	}
	
	public int getDocWaitTotalCount(DocVO_ vo) {
		return mybatis.selectOne("DocDAO.getDocWaitTotalCount", vo);
	}
}
