package com.weaving.biz.email.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weaving.biz.board.BoardVO;
import com.weaving.biz.email.EmailVO;

@Repository
public class EmailDAO {

	
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	/**
	 * Email을 등록한다.
	 * @param vo - 등록할 정보가 담긴 EmailVO
	 * */
	public void insertEmail(EmailVO vo) {
		 mybatis.insert("EmailDAO.insertEmailS", vo);
	}
	
	/**
	 * Email을 수정한다.
	 * @param vo - 등록할 정보가 담긴 EmailVO
	 * */
	public void updateEmail(EmailVO vo) {
		mybatis.update("EmailDAO.updateEmailS", vo);
	}
	
	/**
	 * Email을 삭제한다.
	 * @param vo - 등록할 정보가 담긴 EmailVO
	 * */
	public void deleteEmail(EmailVO vo) {
		mybatis.delete("EmailDAO.deleteEmailS", vo);
	}
	
	/**
	 * Email을 목록 하나 조회한다.
	 * @param vo - 등록할 정보가 담긴 EmailVO 
	 * */
	public EmailVO getEmailOne(EmailVO vo) {
		return(EmailVO)mybatis.selectOne("EmailDAO.selectEmail", vo);
	}
	
	/**
	 * Email을  목록 여럿 조회한다.
	 * */
    public List<EmailVO> getEmailList(EmailVO vo) throws Exception{
    	return mybatis.selectList("EmailDAO.selectEmailList", vo);
    }
    /**
	 * Email을  목록 여럿 조회한다.  G
	 * */
	public List<EmailVO> selectEmailListG(EmailVO vo) throws Exception  {
		return mybatis.selectList("EmailDAO.", vo);
		 /**
		 * Email을  목록 여럿 조회한다. S
		 * */
	}  ;
	public List<EmailVO> selectEmailListS(EmailVO vo) throws Exception {
		 return   null;
		
	};
	 /**
		 * Email을  총 갯수 조회한다.
		 * */
	public int getEmailListToTalCount(EmailVO vo)throws Exception {
		return mybatis.selectOne("EmailDAO.selectEmailListToTalCnt", vo);
	}
	 /**
	 * Email을  총 갯수 조회한다.
	 * */
	public int getEmailListTotalCountG(EmailVO vo) throws Exception {
		return 0;
		
	};
	 /**
	 * Email을  총 갯수 조회한다.
	 * */
	public int getEmailListTotalCountS(EmailVO vo) throws Exception {
		return 0;
	
	};
	
	 /**
	 * Email을  피이징.
	 * */
	public List<EmailVO> getEmailListtPaging(EmailVO vo) throws Exception{
		return mybatis.selectList("EmailDAO.selectEmailListPaging", vo);
	}
}
