package com.weaving.biz.reserv.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weaving.biz.reserv.ReservService;
import com.weaving.biz.reserv.ReservVO;
@Service("reservService")
public class ReservServiceImpl implements ReservService {

	@Autowired
	ReservDAO rss;
	
	@Override
	public void insertReserv(ReservVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateReserv(ReservVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteReserv(ReservVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public ReservVO getReserv(ReservVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReservVO> getReservList() {
		// TODO Auto-generated method stub
		return rss.getReservList();
	}

}
