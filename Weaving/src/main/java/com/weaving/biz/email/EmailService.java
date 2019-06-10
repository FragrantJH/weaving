package com.weaving.biz.email;

import java.util.List;

public interface EmailService{

	public void getWaitEmailList(EmailVO vo);

	void insertEmail(EmailVO vo) throws Exception;
	
	String insertInbox(EmailVO vo) throws Exception;

	// 메일 수정
	void updateEmail(EmailVO vo);

	// 메일 삭제
	void deleteEmail(EmailVO vo);

	// 메일 상세 조회
	EmailVO getINBOXOne(EmailVO vo) throws Exception;
	
	List<EmailVO> getEmailList(EmailVO vo) throws Exception ;
	
	 List<EmailVO> getEmailListtPaging(EmailVO vo);
	
}



