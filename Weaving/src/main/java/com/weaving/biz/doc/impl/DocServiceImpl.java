package com.weaving.biz.doc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weaving.biz.doc.DocService;
import com.weaving.biz.doc.DocVO;
@Service("docService")
public class DocServiceImpl implements DocService {

	//@Autowired BoardDAO dao;
	//@Autowired BoardDAOSpring dao;
	@Autowired DocDAO dao;
	
	// service단위로 메서드 호출
	/*
	@Override
	public void insertBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		//앞단에서 around Aop 트랜잭션 처리 됨.
		//그리고 아래가 실행됨.
		dao.insertBoard(vo);
		//dao.insertBoard(vo);
		//위에 처리가 된 후에 commit가 된다.
	}
*/

	@Override
	public void insertDoc(DocVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateDoc(DocVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteDoc(DocVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<DocVO> getDocList(DocVO vo) {
		// TODO Auto-generated method stub
		return dao.getBoardList(vo);
	}

	@Override
	public int getDocCount(DocVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
