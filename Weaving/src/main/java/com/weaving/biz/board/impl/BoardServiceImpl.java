package com.weaving.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weaving.biz.board.BoardService;
import com.weaving.biz.board.BoardVO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO mybatis;
	
	@Override
	public void insertBoard(BoardVO vo) {
		mybatis.insert(vo);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		mybatis.update(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		mybatis.delete(vo);
	}

	@Override
	public BoardVO getBoardOne(BoardVO vo) {
		return mybatis.getBoardOne(vo);
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		return mybatis.getBoardList(vo);
	}

	@Override
	public List<BoardVO> getBoardListPaging(BoardVO vo) {
		return mybatis.getBoardListPaging(vo);
	}

	@Override
	public int getBoardListTotalCount(BoardVO vo) {
		return mybatis.getBoardListToTalCount(vo);
	}

}
