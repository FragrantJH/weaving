package com.weaving.biz.dept;

import java.util.List;

public interface DeptService {
	
	// 글 등록
			void insertDept(DeptVO vo);

			// 글 수정
			void updateDept(DeptVO vo);

			// 글 삭제
			void deleteDept(DeptVO vo);

			// 글 상세 조회
			DeptVO getDept(DeptVO vo);

			// 글 목록 조회
			List<DeptVO> getDeptList(DeptVO vo);
			
			public int getDeptCount(DeptVO vo);

}
