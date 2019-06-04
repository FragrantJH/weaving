package com.weaving.biz.reserv;

import java.util.List;

public interface ReservService {
	
	void insertReserv(ReservVO vo);
	
	void updateReserv(ReservVO vo);
	
	void deleteReserv(ReservVO vo);
	
	ReservVO getReserv(ReservVO vo);
	
	List<ReservVO> getReservList();

	int getDuplicateCheck(ReservVO vo);
	}
