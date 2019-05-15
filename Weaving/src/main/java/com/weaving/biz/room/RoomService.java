package com.weaving.biz.room;

import java.util.List;

public interface RoomService {
	
	void insertRoom(RoomVO vo);
	
	void updateRoom(RoomVO vo);
	
	void deleteRoom(RoomVO vo);
	
	RoomVO getRoom(RoomVO vo);
	
	List<RoomVO> getRoomList(RoomVO vo);
}
