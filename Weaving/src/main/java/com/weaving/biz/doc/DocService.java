package com.weaving.biz.doc;

import java.util.List;

public interface DocService {
	// 문서입력
	void insertDoc(DocVO_ vo);
	
	// 결재자문서입력
	void insertDocDetail(DocVO_ vo);
	
	// 문서수정
	void updateDoc(DocVO_ vo);
	// 문서삭제	
	void deleteDoc(DocVO_ vo);
	// 문서조회
	List<DocVO_> getDocList(DocVO_ vo);
	// 대기 문서 조회
	List<DocVO_> getDocWaitList(DocVO_ vo);
	// 문서 수
	int getDocCount(DocVO_ vo);
	// 대기상태 문서리스트 수
	int getDocWaitTotalCount(DocVO_ vo);
	// 문서 history입력
	void insertDocHistory(DocHistoryVO vo);	
}
