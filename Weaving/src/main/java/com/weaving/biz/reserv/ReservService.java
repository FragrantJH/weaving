package com.weaving.biz.reserv;

import java.util.List;
import java.util.Map;

public interface ReservService {
	
	void insertReserv(ReservVO vo);
	
	void updateReserv(ReservVO vo);
	
	void deleteReserv(ReservVO vo);
	
	ReservVO getReserv(ReservVO vo);
	
	List<ReservVO> getReservList();

	List<Map<String, Object>> getResultState();
	
	int getDuplicateCheck(ReservVO vo);
	}
