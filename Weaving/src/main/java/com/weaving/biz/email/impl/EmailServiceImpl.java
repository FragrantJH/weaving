package com.weaving.biz.email.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weaving.biz.email.EmailService;
import com.weaving.biz.email.EmailVO;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	EmailDAO dao;
	
	@Override
	public void getWaitEmailList(EmailVO vo) {
		
	}

	@Override
	public void insertEmail(EmailVO vo)  {
		
	}

	@Override
	public void updateEmail(EmailVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteEmail(EmailVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public EmailVO getEmailOne(EmailVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EmailVO> getEmailList(EmailVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EmailVO> getEmailListPaging(EmailVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getEmailListTotalCount(EmailVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<EmailVO> selectEmailListG(EmailVO vo)  {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EmailVO> selectEmailListS(EmailVO vo)  {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getEmailListTotalCountG(EmailVO vo)  {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getEmailListTotalCountS(EmailVO vo)  {
		// TODO Auto-generated method stub
		return 0;
	}

}
