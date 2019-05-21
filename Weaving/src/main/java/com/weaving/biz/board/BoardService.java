package com.weaving.biz.board;

import java.util.List;

public interface BoardService {

	// CRUD 기능의 메소드 구현
	// 글 등록
	void insertBoard(BoardVO vo);

	// 글 수정
	void updateBoard(BoardVO vo);

	// 글 삭제
	void deleteBoard(BoardVO vo);

	// 글 상세 조회
	BoardVO getBoardOne(BoardVO vo);

	// 글 목록 조회
	List<BoardVO> getBoardList(BoardVO vo);

	// 페이징 처리
	List<BoardVO> getBoardListPaging(BoardVO vo);
	
	// 전체 건수
	int getBoardListTotalCount(BoardVO vo);
}