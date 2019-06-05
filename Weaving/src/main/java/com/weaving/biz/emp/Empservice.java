package com.weaving.biz.emp;

import java.util.List;
import java.util.Map;



public interface Empservice {
	
		// 글 등록
		void insertEmp(EmpVO vo);

		// 글 수정
		void updateEmp(EmpVO vo);

		// 글 삭제
		void deleteEmp(EmpVO vo);

		//로그인
		EmpVO getEmp(EmpVO vo);
		
		//번호조회
		EmpVO getReadyEmpNo(EmpVO vo);
		
		// 글 상세 조회
		EmpVO getEmpl(EmpVO vo);

		// 글 목록 조회
		List<EmpVO> getEmpList(EmpVO vo);
		
		List<EmpVO> getExEmpList(EmpVO vo);
		
		public int getEmpCount(EmpVO vo);
		
		//퇴사처리
		void updateDelEmp(EmpVO vo);
		
		public List<Map> insertExcelTest(List<EmpVO> list); 
		
		//중복체크
		EmpVO emailcheck(EmpVO vo);

}
