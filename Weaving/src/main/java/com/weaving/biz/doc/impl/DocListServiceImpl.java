package com.weaving.biz.doc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weaving.biz.doc.DocBaseVO;
import com.weaving.biz.doc.DocListService;
import com.weaving.biz.doc.DocReturnVO;
import com.weaving.biz.doc.DocWaitVO;

@Service
public class DocListServiceImpl implements DocListService {

	@Autowired
	DocListDAO dao;

	@Override
	public List<DocBaseVO> getDoneDocList(int empNo) {
		return dao.getDoneDocList(empNo);
	}

	@Override
	public List<DocWaitVO> getWaitDocList(int empNo) {
		return dao.getWaitDocList(empNo);
	}

	@Override
	public List<DocReturnVO> getReturnDocList(int empNo) {
		return dao.getReturnDocList(empNo);
	}

	@Override
	public List<DocBaseVO> getIngDocList(int empNo) {
		return dao.getIngDocList(empNo);
	}

	@Override
	public List<DocBaseVO> getTempDocList(int empNo) {
		return dao.getTempDocList(empNo);
	}
}
