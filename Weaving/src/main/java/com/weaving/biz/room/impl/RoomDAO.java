package com.weaving.biz.room.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weaving.biz.room.RoomVO;

@Repository
public class RoomDAO {
	
	@Autowired
	public SqlSessionTemplate ss;
	
	public void insert(RoomVO vo) {
		ss.insert("RoomDAO.insertRoom", vo);
	}	
}
