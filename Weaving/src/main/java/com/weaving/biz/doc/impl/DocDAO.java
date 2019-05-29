package com.weaving.biz.doc.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weaving.biz.doc.DocInsertVO;

@Repository
public class DocDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public void insertDoc(DocInsertVO vo) {
		mybatis.insert("DocDAO.insertDoc", vo);
	}
	
	public void insertDocDetail(DocInsertVO vo) {
		mybatis.insert("DocDAO.insertDocDeatil", vo);
	}
	
	public List<DocInsertVO> getBoardList(DocInsertVO vo) {
		//
		return mybatis.selectList("DocDAO.getDocList", vo);
	}

	public List<DocInsertVO> getDocWaitList(DocInsertVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("DocDAO.getDocWaitList", vo);
	}
	
	public int getDocWaitTotalCount(DocInsertVO vo) {
		return mybatis.selectOne("DocDAO.getDocWaitTotalCount", vo);
	}
}
