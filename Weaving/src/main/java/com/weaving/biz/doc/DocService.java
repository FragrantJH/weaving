package com.weaving.biz.doc;

import java.util.List;

public interface DocService {
	// 문서입력
	void insertDoc(DocVO vo);
	
	// 결재자문서입력
	void insertDocDetail(DocVO vo);
	
	// 문서수정
	void updateDoc(DocVO vo);
	// 문서삭제	
	void deleteDoc(DocVO vo);
	// 문서조회
	List<DocVO> getDocList(DocVO vo);
	// 대기 문서 조회
	List<DocVO> getDocWaitList(DocVO vo);
	// 문서 수
	int getDocCount(DocVO vo);
	// 대기상태 문서리스트 수
	int getDocWaitTotalCount(DocVO vo);
	// 문서 history입력
	void insertDocHistory(DocHistoryVO vo);	
}
