package com.weaving.biz.docForm.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weaving.biz.docForm.DocFormVO;

@Repository
public class DocFormDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	public void insertDocForm(DocFormVO vo) {
		mybatis.insert("DocFormDAO.insertDocForm", vo);
	}

	public void updateDocForm(DocFormVO vo) {
		mybatis.update("DocFormDAO.updateDocForm", vo);
	}

	public void deleteDocForm(DocFormVO vo) {
		mybatis.delete("DocFormDAO.deleteDocForm", vo);
	}

	public DocFormVO getDocForm(DocFormVO vo) {
		return mybatis.selectOne("DocFormDAO.selectDocForm", vo);
	}

	public List<DocFormVO> getDocFormList() {
		return mybatis.selectList("DocFormDAO.selectDocFormList");
	}
	
	public List<DocFormVO> getDocFormListPaging(DocFormVO vo) {
		return mybatis.selectList("DocFormDAO.selectDocFormListPaging", vo);
	}

	public int getDocFormTotalCount() {
		return mybatis.selectOne("DocFormDAO.selectDocFormTotalCnt");
	}

}
