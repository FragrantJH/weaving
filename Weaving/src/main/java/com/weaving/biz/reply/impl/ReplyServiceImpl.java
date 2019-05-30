package com.weaving.biz.reply.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weaving.biz.reply.ReplyService;
import com.weaving.biz.reply.ReplyVO;

@Service("ReplyService")
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyDAO mybatis;
	
	@Override
	public void insertReply(ReplyVO vo) {
		mybatis.insert(vo);
	}

	@Override
	public void updateReply(ReplyVO vo) {
		mybatis.update(vo);
	}

	@Override
	public void deleteReply(ReplyVO vo) {
		mybatis.delete(vo);	
	}

	@Override
	public List<ReplyVO> getReplyListPaging(ReplyVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getReplyListToTalCount(ReplyVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReplyVO> getReplyList(Integer boardId) {
		return mybatis.getReplyList(boardId);
	}
	
}
