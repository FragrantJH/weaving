package com.weaving.biz.reply.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weaving.biz.reply.ReplyVO;

@Repository
public class ReplyDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	// 댓글 입력
	public void insert(ReplyVO vo) {
		mybatis.insert("ReplyDAO.insertReply", vo);
	}
	
	// 댓글 수정
	public void update(ReplyVO vo) {
		mybatis.update("ReplyDAO.updateReply", vo);
	}
	
	// 댓글 삭제
	public void delete(Integer replyId) {
		mybatis.delete("ReplyDAO.deleteReply", replyId);
	}

	// 댓글 목록
	public List<ReplyVO> getReplyList(ReplyVO vo) {
		return mybatis.selectList("ReplyDAO.getReplyList", vo);
	}

}
