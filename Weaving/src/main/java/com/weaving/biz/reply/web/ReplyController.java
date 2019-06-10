package com.weaving.biz.reply.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	//댓글 목록 (데이터 리턴)
	@RequestMapping("listJson.do")
	@ResponseBody
	public List<ReplyVO> listJson(@RequestParam int boardId){
		ReplyVO vo = new ReplyVO();
		vo.setBoardId(boardId);
		List<ReplyVO> list = service.getReplyList(vo);
		return list;
	}
	
	//댓글 수정
	@RequestMapping(value="/updateReply")
	public ReplyVO replyUpdate(ReplyVO vo){
		ResponseEntity<String> entity = null;
		try {
			service.updateReply(vo);
			// 댓글 수정이 성공하면 성공 상태메시지 저장
			//entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			// 댓글 수정이 실패하면 실패 상태메시지 저장
			//entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		// 수정 처리 http 상태 메시지 리턴
		return vo;
	} 
			
	//댓글 삭제
	@RequestMapping(value="/delete/{replyId}")
	public ResponseEntity<String> replyDelete(@PathVariable("replyId") Integer replyId){
		ResponseEntity<String> entity = null;
		try {
			service.deleteReply(replyId);
			// 댓글 삭제가 성공하면 성공 상태메시지 저장
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			// 댓글 삭제가 실패하면 실패 상태메시지 저장
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		// 삭제 처리 http 상태 메시지 리턴
		return entity;
	} 
}
