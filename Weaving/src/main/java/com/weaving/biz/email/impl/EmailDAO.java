package com.weaving.biz.email.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weaving.biz.board.BoardVO;
import com.weaving.biz.email.EmailVO;
import com.weaving.biz.email.MessageVO;

@Repository
public class EmailDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	/**
	 * Email을 등록한다.
	 * @param vo - 등록할 정보가 담긴 EmailVO
	 * */
	public void insertEmail(EmailVO vo) throws Exception{
		mybatis.insert("EmailDAO.insertEmail", vo);
	}
	/**
	 * Email을 등록한다.
	 * @param vo - 등록할 정보가 담긴 EmailVO
	 * */
	public void insertInbox(EmailVO vo) throws Exception{
		mybatis.insert("EmailDAO.insertInbox", vo);
		vo.setEmailId(1);
		
	}
	
	/**
	 * Email을 수정한다.
	 * @param vo - 등록할 정보가 담긴 EmailVO
	 * */
	public void updateEmail(EmailVO vo) {
		mybatis.update("EmailDAO.updateEmail", vo);
	}
	
	/**
	 * Email을 삭제한다.
	 * @param vo - 등록할 정보가 담긴 EmailVO
	 * */
	public void deleteEmail(EmailVO vo) {
		mybatis.delete("EmailDAO.deleteEmail", vo);
	}
	
	/**
	 * Email을 목록 하나 조회한다.
	 * @param vo - 등록할 정보가 담긴 EmailVO 
	 * */
	public EmailVO getINBOXOne(EmailVO vo)throws Exception {
		return (EmailVO) mybatis.selectOne("EmailDAO.getINBOXOne", vo);
	}
	
	/**
	 * Email을  목록 여럿 조회한다.
	 * */
    public List<EmailVO> getEmailList(EmailVO vo) throws Exception{
    	return mybatis.selectList("EmailDAO.getEmailList", vo);
    }
	
	 /**
	 * Email을  피이징.
	 * */
	public List<EmailVO> getEmailListtPaging(EmailVO vo) throws Exception{
		return mybatis.selectList("EmailDAO.selectEmailListPaging", vo);
	}
}
