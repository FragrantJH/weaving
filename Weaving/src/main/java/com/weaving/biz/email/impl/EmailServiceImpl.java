package com.weaving.biz.email.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weaving.biz.email.EmailService;
import com.weaving.biz.email.EmailVO;
import com.weaving.biz.email.MessageVO;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	EmailDAO dao;
	
	@Override
	public void getWaitEmailList(EmailVO vo) {
		
	}

	@Override
	public String insertEmail(EmailVO vo) throws Exception  {
			dao.insertEmail(vo);
			return null;
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
		// TODO Auto-generated method stub
		
	}

	@Override
	public EmailVO getEmailOne(EmailVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<?> getEmailList(EmailVO vo) throws Exception {
	
		return dao.getEmailList(vo);
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
	public List<?> selectEmailListG(MessageVO mvo) throws Exception  {
	
		return dao.selectEmailListG(mvo);
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

	@Override
	public int mailReadCheck(EmailVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<?> getEmailList(MessageVO mvo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	

}
