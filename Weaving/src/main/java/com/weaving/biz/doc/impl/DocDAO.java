package com.weaving.biz.doc.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weaving.biz.doc.DocApprovalVO;
import com.weaving.biz.doc.DocDetailVO;
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
	
	public void updateApprovalDoc(DocApprovalVO vo) {
		mybatis.update("DocDAO.updateDoneDoc", vo);
	}
	public DocDetailVO getDocument(DocDetailVO vo) {
		return mybatis.selectOne("DocDAO.getDocument", vo);
	}
	public List<DocInsertVO> getDocDetail(DocDetailVO vo) {
		//
		return mybatis.selectList("DocDAO.getDocDetail", vo);
	}
}
