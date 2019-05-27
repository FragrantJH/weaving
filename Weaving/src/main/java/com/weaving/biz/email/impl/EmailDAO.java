package com.weaving.biz.email.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weaving.biz.email.EmailVO;

@Repository
public class EmailDAO {

	
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	 
    public List<EmailVO> getEmailList(EmailVO vo) {
    	return mybatis.selectList("EmailDAO.selectEmailList", vo);
    }
	
	public List<EmailVO> getEmailListtPaging(EmailVO vo) {
		return mybatis.selectList("EmailDAO.selectEmailListPaging", vo);
	}
	public int getEmailListToTalCount(EmailVO vo) {
		return mybatis.selectOne("EmailDAO.selectEmailListToTalCnt", vo);
	}

}
