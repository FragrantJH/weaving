package com.weaving.biz.room.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.weaving.biz.room.RoomService;
import com.weaving.biz.room.RoomVO;

public class RoomServiceImpl implements RoomService {
	
	@Autowired
	RoomDAO SS;

	@Override
	public void insertRoom(RoomVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateRoom(RoomVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteRoom(RoomVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public RoomVO getRoom(RoomVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RoomVO> getRoomList(RoomVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

}
