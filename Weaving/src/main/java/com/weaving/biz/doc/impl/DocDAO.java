package com.weaving.biz.doc.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weaving.biz.doc.DocApprovalVO;
import com.weaving.biz.doc.DocDeleteVO;
import com.weaving.biz.doc.DocDetailVO;
import com.weaving.biz.doc.DocInsertVO;
import com.weaving.biz.doc.DocUpdateVO;

@Repository
public class DocDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public void insertDoc(DocInsertVO vo) {
		mybatis.insert("DocDAO.insertDoc", vo);
	}
	
	public void insertDocDetail(DocInsertVO vo) {
		mybatis.insert("DocDAO.insertDocDetail", vo);
	}
	public void updateDoc(DocUpdateVO vo) {
		mybatis.update("DocDAO.updateDoc", vo);
	}
	public void updateApprovalDoc(DocApprovalVO vo) {
		mybatis.update("DocDAO.updateDoneDoc", vo);
	}
	public void updateReturnEmpNoNull(DocApprovalVO vo) {
		mybatis.update("DocDAO.updateReturnEmpNoNull", vo);
	}	
	public void updateReturnEmpNo(DocApprovalVO vo) {
		mybatis.update("DocDAO.updateReturnEmpNo", vo);
	}
	
	public void updateReturnDoc(DocApprovalVO vo) {
		mybatis.update("DocDAO.updateReturnDoc", vo);
	}
	public void updateReturnComment(DocApprovalVO vo) {
		mybatis.update("DocDAO.updateReturnComment", vo);
	}
	public void updateApprovalNullDate(DocApprovalVO vo) {
		mybatis.update("DocDAO.updateApprovalNullDate", vo);
	}
	public void delteDocDetail(DocDeleteVO vo) {
		mybatis.delete("DocDAO.delteDocDetail", vo);
	}
	
	public DocDetailVO getDocument(DocDetailVO vo) {
		return mybatis.selectOne("DocDAO.getDocument", vo);
	}
	public DocDetailVO getReturnComment(DocDetailVO vo) {
		return mybatis.selectOne("DocDAO.getReturnComment", vo);
	}	
	public List<DocInsertVO> getDocDetail(DocDetailVO vo) {
		//
		return mybatis.selectList("DocDAO.getDocDetail", vo);
	}
}
