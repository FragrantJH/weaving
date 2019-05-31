package com.weaving.biz.reply;

import java.util.List;

public interface ReplyService {

	//댓글 등록
	void insertReply(ReplyVO vo);
	
	//댓글 수정
	void updateReply(ReplyVO vo);
	
	//댓글 삭제
	void deleteReply(Integer replyId);
	
	//댓글 목록 조회
	List<ReplyVO> getReplyList(ReplyVO vo);
	
	//페이징 처리
	//List<ReplyVO> getReplyListPaging(ReplyVO vo);
	
	//전체 건수
	//int getReplyListToTalCount(ReplyVO vo);
}
