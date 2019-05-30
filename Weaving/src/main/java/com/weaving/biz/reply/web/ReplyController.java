package com.weaving.biz.reply.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.weaving.biz.reply.ReplyService;
import com.weaving.biz.reply.ReplyVO;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {

	@Autowired
	ReplyService service;
	
	//댓글 등록 
	@RequestMapping("insert.do")
	public void replyInsert(@ModelAttribute ReplyVO vo, HttpSession session) {
		Integer empNo = (Integer) session.getAttribute("empNo");
		vo.setEmpNo(empNo);
		service.insertReply(vo);
	}

	//댓글 목록 (화면 리턴)
//	@RequestMapping("list.do")
//	public ModelAndView list(@RequestParam int boardId, ModelAndView mav) {
//		List<ReplyVO> list = service.getReplyList(boardId);
//		mav.setViewName("board/replyList");
//		mav.addObject("list", list);
//		return mav;
//	}
	
	//댓글 목록 (데이터 리턴)
	@RequestMapping("listJson.do")
	@ResponseBody
	public List<ReplyVO> listJson(@RequestParam int boardId){
		ReplyVO vo = new ReplyVO();
		vo.setBoardId(boardId);
		List<ReplyVO> list = service.getReplyList(vo);
		return list;
	}
	
}
