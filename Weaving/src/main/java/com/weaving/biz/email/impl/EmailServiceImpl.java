package com.weaving.biz.email.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weaving.biz.email.EmailService;
import com.weaving.biz.email.EmailVO;
import com.weaving.biz.email.MessageVO;
import com.weaving.biz.emp.EmpVO;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	EmailDAO dao;
	
	@Override
	public void getWaitEmailList(EmailVO vo) {
		
	}

	@Override
	public void insertEmail(EmailVO vo) throws Exception  {
			dao.insertEmail(vo);
	}
	
	@Override
	public String insertInbox(EmailVO vo) throws Exception {
		
		dao.insertInbox(vo);
		return null;
	}

	@Override
	public void updateEmail(EmailVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteEmail(EmailVO vo) {
		dao.deleteEmail(vo);
		
	}


	public List<EmailVO> getEmailList(EmailVO vo) throws Exception {
		
		return (List<EmailVO>) dao.getEmailList(vo);
	}


	@Override
	public EmailVO getINBOXOne(EmailVO vo) throws Exception {
	
		vo.setReadCheck("1");
		dao.updateRCR(vo);
		return dao.getINBOXOne(vo);
	}

	@Override
	public List<EmailVO> getEmailListtPaging(EmailVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteInbox(EmailVO vo) {
		dao.deleteInbox(vo);
	}

	@Override
	public void updateRCR(EmailVO vo) {
		dao.updateRCR(vo);
		
	}

	@Override
	public void updateRCNR(EmailVO vo) {
		dao.updateRCNR(vo);
		
	}
	}

	


