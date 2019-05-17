package com.weaving.biz.board.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.weaving.biz.board.BoardService;
import com.weaving.biz.board.BoardVO;

@Controller
public class BoardController {

	@Autowired
	BoardService service;

	// 등록폼
	@RequestMapping("/boardInsertForm")
	public String boardInsertForm() {
		return "board/boardInsert";

	}

	// 등록 처리
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
	
	// 글 상세 조회
	@RequestMapping("/boardOne/{boardId}")
	public String boardOne(@ModelAttribute("board") BoardVO vo, @PathVariable Integer boardId, Model model) {
		vo.setBoardId(boardId);
		model.addAttribute("board", service.getBoardOne(vo));
		return "board/boardOne";
	}
		
	// 수정폼 
	@RequestMapping(value = "/boardUpdate/{boardId}")
	public String boardUpdateForm(BoardVO vo, @PathVariable Integer boardId, Model model) { 
		vo.setBoardId(boardId);
		model.addAttribute("board", service.getBoardOne(vo));
		return "board/boardUpdate"; 
	}

	// 수정 처리
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.POST)
	public String boardUpdate(BoardVO vo) {
		service.updateBoard(vo);
		return "redirect:boardList";
	}
	
	// 삭제
	@RequestMapping(value = "/boardDelete", method = RequestMethod.GET)
	public String boardDelete(BoardVO vo, HttpServletRequest request) {
		vo.setBoardId(Integer.parseInt(request.getParameter("boardId")));
		service.deleteBoard(vo);
		return "redirect:boardList";
	}
	
	
}