package com.weaving.biz.board.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.weaving.biz.board.BoardService;
import com.weaving.biz.board.BoardVO;
import com.weaving.biz.common.Paging;
import com.weaving.biz.common.SessionInfo;
import com.weaving.biz.emp.EmpVO;

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
	public String boardInsert(BoardVO vo, HttpSession session) {
		vo.setBoardType((Character)session.getAttribute("boardType"));
		EmpVO empVO = SessionInfo.getInfo(session, "emp");
		vo.setEmpNo(empVO.getEmpNo());
		service.insertBoard(vo);
		return "redirect:boardList?boardType="+ vo.getBoardType();
	}
	
	// 글 목록 조회
	@RequestMapping("/boardList")
	public ModelAndView getBoardList(ModelAndView mav, Paging paging, BoardVO vo, HttpSession session) {
		//페이지 번호 파라미터
		if (paging.getPage() == 0) {
			paging.setPage(1);
		}
		System.out.println(vo);
		if (vo.getBoardType() == ' '  ) {
			vo.setBoardType((Character)session.getAttribute("boardType"));
		} else {
			session.setAttribute("boardType", vo.getBoardType());
		}
				
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		
		//전체건수
		paging.setTotalRecord(service.getBoardListTotalCount(vo));
		List<BoardVO> list = service.getBoardListPaging(vo);
		
		mav.addObject("paging", paging);
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
	public String boardUpdate(BoardVO vo, HttpSession session) {
		vo.setBoardType((Character)session.getAttribute("boardType"));
		service.updateBoard(vo);
		return "redirect:boardList?boardType="+ vo.getBoardType();
	}
	
	// 삭제
	@RequestMapping(value = "/boardDelete", method = RequestMethod.GET)
	public String boardDelete(BoardVO vo, HttpSession session, HttpServletRequest request) {
		vo.setBoardId(Integer.parseInt(request.getParameter("boardId")));
		vo.setBoardType((Character)session.getAttribute("boardType"));
		service.deleteBoard(vo);
		return "redirect:boardList?boardType="+ vo.getBoardType();
	}
		
}