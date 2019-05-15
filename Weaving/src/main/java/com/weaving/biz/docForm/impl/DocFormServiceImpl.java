package com.weaving.biz.docForm.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weaving.biz.docForm.DocFormSearchVO;
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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteDocForm(DocFormVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public DocFormVO getDocForm(DocFormVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DocFormVO> getDocFormList(DocFormSearchVO vo) {
		
		return mybatis.getDocFormList(vo);
	}

	@Override
	public int getDocFormTotalCount() {
		return mybatis.getDocFormTotalCount();
	}

}
