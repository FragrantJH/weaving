package com.weaving.biz.doc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weaving.biz.doc.DocBaseVO;
import com.weaving.biz.doc.DocListService;

@Service
public class DocListServiceImpl implements DocListService{

	@Autowired 
	DocListDAO dao;
	
	@Override
	public List<DocBaseVO> getDoneDocList(int empNo) {
		return dao.getDoneDocList(empNo);
	}

}
