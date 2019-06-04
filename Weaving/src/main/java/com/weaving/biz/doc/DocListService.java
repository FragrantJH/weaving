package com.weaving.biz.doc;

import java.util.List;

public interface DocListService {
	List<DocBaseVO> getDoneDocList(int empNo);

	List<DocWaitVO> getWaitDocList(int empNo);

	List<DocReturnVO> getReturnDocList(int empNo);

	List<DocBaseVO> getIngDocList(int empNo);

	List<DocBaseVO> getTempDocList(int empNo);
	
	int getTotalIngCount();
	
	int getTotalDoneCount();
	
	int getTotalReturnCount();
	
	int getTotalTempCount();
}
