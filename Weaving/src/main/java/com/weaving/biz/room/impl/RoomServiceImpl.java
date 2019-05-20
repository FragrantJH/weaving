package com.weaving.biz.room.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;

import com.weaving.biz.room.RoomService;
import com.weaving.biz.room.RoomVO;

@Service("roomService")
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	RoomDAO ss;

	@Override
	public void insertRoom(RoomVO vo) {
		ss.insert(vo);

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
	public List<RoomVO> getRoomList() {
		// TODO Auto-generated method stub
		return ss.getRoomList();
	}

}
