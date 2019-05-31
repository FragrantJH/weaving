package com.weaving.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ReadMailcheck")
public class ReadMailCheckServiceImpl implements ReadMailCheckService {

		@Autowired
		ReadMailCheckDAO mybatis;
		
		@Override
		public int getUnReadMailCheck(int empNo) {
			// TODO Auto-generated method stub
			return mybatis.getUnReadMailCount(empNo);
		}
}
