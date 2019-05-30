package com.weaving.biz.doc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weaving.biz.doc.DocBaseVO;
import com.weaving.biz.doc.DocListService;
import com.weaving.biz.doc.DocWaitVO;

@Service
public class DocListServiceImpl implements DocListService{

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
	public int getWaitDocCount(int empNo) {
		return dao.getWaitDocCount(empNo);
	}
}
