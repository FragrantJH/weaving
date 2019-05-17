package com.weaving.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weaving.biz.board.BoardVO;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
   
	public void insert(BoardVO vo) {
		System.out.println(vo);
		vo.setEmpNo(1);
		mybatis.insert("BoardDAO.insertBoard", vo);
	}
		
	public void update(BoardVO vo) {
		mybatis.update("BoardDAO.updateBoard", vo);
	}
	
	public void delete(BoardVO vo) {
		mybatis.delete("BoardDAO.deleteBoard", vo);
	}
	
    public BoardVO getBoardOne(BoardVO vo) {
    	return (BoardVO)mybatis.selectOne("BoardDAO.selectBoardOne",vo);
    }
    
    public List<BoardVO> getBoardList(BoardVO vo) {
    	return mybatis.selectList("BoardDAO.selectBoardList", vo);
    }
	
		
}
