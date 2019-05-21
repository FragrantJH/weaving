package com.weaving.biz.docForm.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weaving.biz.docForm.DocFormService;
import com.weaving.biz.docForm.DocFormVO;

@Service("docFormService")
public class DocFormServiceImpl implements DocFormService {

	@Autowired
	DocFormDAO dao;
	
	@Override
	public void insertDocForm(DocFormVO vo) {
		dao.insertDocForm(vo);
	}

	@Override
	public void updateDocForm(DocFormVO vo) {
		dao.updateDocForm(vo);
	}

	@Override
	public void deleteDocForm(DocFormVO vo) {
		dao.deleteDocForm(vo);
	}

	@Override
	public DocFormVO getDocForm(DocFormVO vo) {
		return dao.getDocForm(vo);
	}

	@Override
	public List<DocFormVO> getDocFormListPaging(DocFormVO vo) {
		return dao.getDocFormListPaging(vo);
	}

	@Override
	public int getDocFormTotalCount() {
		return dao.getDocFormTotalCount();
	}

	@Override
	public List<DocFormVO> getDocFormList() {
		return dao.getDocFormList();
	}

}
