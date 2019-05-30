package com.weaving.biz.reply.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weaving.biz.reply.ReplyVO;

@Repository
public class ReplyDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	public void insert(ReplyVO vo) {
		mybatis.insert("ReplyDAO.insertReply", vo);
	}

	public void update(ReplyVO vo) {
		mybatis.update("ReplyDAO.updateReply", vo);
	}
	
	public void delete(ReplyVO vo) {
		mybatis.delete("ReplyDAO.deleteReply", vo);
	}

	public List<ReplyVO> getReplyList(Integer boardId) {
		return mybatis.selectList("reply.getReplyList", boardId);
	}

}
