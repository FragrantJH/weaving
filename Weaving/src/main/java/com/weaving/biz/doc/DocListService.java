package com.weaving.biz.doc;

import java.util.List;

public interface DocListService {
	List<DocBaseVO> getDoneDocList(int empNo);
	
	List<DocWaitVO> getWaitDocList(int empNo);
}
