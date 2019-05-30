package com.weaving.biz.email;

import java.util.List;

public interface EmailService{

	public void getWaitEmailList(EmailVO vo);

	void insertEmail(EmailVO vo);

	// 메일 수정
	void updateEmail(EmailVO vo);

	// 메일 삭제
	void deleteEmail(EmailVO vo);

	// 메일 상세 조회
	EmailVO getEmailOne(EmailVO vo);

	//메일 목록 조회
	List<EmailVO> getEmailList(EmailVO vo);

	// 페이징 처리
	List<EmailVO> getEmailListPaging(EmailVO vo);
	
	//메일 목록 조회  get
	List<EmailVO>selectEmailListG(EmailVO vo);
	
	//메일 목록 조회 set
	List<EmailVO>selectEmailListS(EmailVO vo);
		
	
	// 전체 건수
	int getEmailListTotalCount(EmailVO vo);
	
	// 전체 건수get
	int getEmailListTotalCountG(EmailVO vo);
	
	// 전체 건수 set 
	int getEmailListTotalCountS(EmailVO vo);
	
}



