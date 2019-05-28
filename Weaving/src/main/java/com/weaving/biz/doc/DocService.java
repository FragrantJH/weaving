package com.weaving.biz.doc;

import java.util.List;

public interface DocService {
	// 문서입력
	void insertDoc(DocInsertVO vo);
	
	// 결재자문서입력
	void insertDocDetail(DocInsertVO vo);
	
	// 문서수정
	void updateDoc(DocInsertVO vo);
	// 문서삭제	
	void deleteDoc(DocInsertVO vo);
	// 문서조회
	List<DocInsertVO> getDocList(DocInsertVO vo);
	// 대기 문서 조회
	List<DocInsertVO> getDocWaitList(DocInsertVO vo);
	// 문서 수
	int getDocCount(DocInsertVO vo);
	// 대기상태 문서리스트 수
	int getDocWaitTotalCount(DocInsertVO vo);
	// 문서 history입력
	void insertDocHistory(DocHistoryVO vo);	
}
