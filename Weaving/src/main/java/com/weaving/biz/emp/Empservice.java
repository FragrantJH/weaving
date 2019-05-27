package com.weaving.biz.emp;

import java.util.List;

public interface Empservice {
	
		// 글 등록
		void insertEmp(EmpVO vo);

		// 글 수정
		void updateEmp(EmpVO vo);

		// 글 삭제
		void deleteEmp(EmpVO vo);

		// 글 상세 조회
		EmpVO getEmp(EmpVO vo);

		// 글 목록 조회
		List<EmpVO> getEmpList(EmpVO vo);
		
		public int getEmpCount(EmpVO vo);
		
		//퇴사처리
		void updateDelEmp(EmpVO vo);

}
