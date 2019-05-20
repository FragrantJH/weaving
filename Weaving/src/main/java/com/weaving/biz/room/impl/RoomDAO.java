package com.weaving.biz.room.impl;



import java.util.List;

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
	
	public List<RoomVO> getRoomList() {
		return ss.selectList("RoomDAO.selectRoomList");
	}
}
