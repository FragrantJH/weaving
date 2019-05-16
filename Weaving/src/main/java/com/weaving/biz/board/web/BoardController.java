package com.weaving.biz.board.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.weaving.biz.board.BoardService;
import com.weaving.biz.board.BoardVO;

@Controller
public class BoardController {

	@Autowired
	BoardService service;

	// 게시판 조회
//	@RequestMapping("/boardList")
//	public String board() {
//		return "board/boardList";
//	}

	// 등록폼
	@RequestMapping("/boardInsertForm")
	public String boardInsertForm() {
		return "board/boardInsert";

	}

	// 등록처리
	@RequestMapping("/boardInsert")
	public String boardInsert(BoardVO vo) {
		service.insertBoard(vo);
		return "redirect:boardList";
	}
	
	// 글 목록 조회
	@RequestMapping("/boardList")
	public ModelAndView getBoardList(ModelAndView mav) {
		BoardVO vo = new BoardVO();
		List<BoardVO> list = service.getBoardList(vo);
		
		mav.addObject("boardList", list);
		mav.setViewName("board/boardList");
		
		return mav;
	}
	
	
	//글 상세 조회
	
	
	
	
	// 수정폼
	// @RequestMapping("/boardUpdate")
	// public String boardUpdateForm()

}