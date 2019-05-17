package com.weaving.biz.docForm.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weaving.biz.docForm.DocFormService;
import com.weaving.biz.docForm.DocFormVO;

@Service("docFormService")
public class DocFormServiceImpl implements DocFormService {

	@Autowired
	DocFormDAO mybatis;
	
	@Override
	public void insertDocForm(DocFormVO vo) {
		mybatis.insertDocForm(vo);
	}

	@Override
	public void updateDocForm(DocFormVO vo) {
		mybatis.updateDocForm(vo);
	}

	@Override
	public void deleteDocForm(DocFormVO vo) {
		mybatis.deleteDocForm(vo);
	}

	@Override
	public DocFormVO getDocForm(DocFormVO vo) {
		return mybatis.getDocForm(vo);
	}

	@Override
	public List<DocFormVO> getDocFormListPaging(DocFormVO vo) {
		return mybatis.getDocFormListPaging(vo);
	}

	@Override
	public int getDocFormTotalCount() {
		return mybatis.getDocFormTotalCount();
	}

	@Override
	public List<DocFormVO> getDocFormList() {
		return mybatis.getDocFormList();
	}

}
