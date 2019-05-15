package com.weaving.biz.docForm;

import java.util.List;

public interface DocFormService {

	void insertDocForm(DocFormVO vo);
	
	void updateDocForm(DocFormVO vo);
	
	void deleteDocForm(DocFormVO vo);
	
	DocFormVO getDocForm(DocFormVO vo);
	
	List<DocFormVO> getDocFormList(DocFormSearchVO vo);
	
	int getDocFormTotalCount();
}
