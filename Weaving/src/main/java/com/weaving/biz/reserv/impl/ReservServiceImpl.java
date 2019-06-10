package com.weaving.biz.reserv.impl;

import java.util.List;
import java.util.Map;

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
		System.out.println(vo);
		rss.insert(vo);
	}

	@Override
	public void updateReserv(ReservVO vo) {
		// TODO Auto-generated method stub
		rss.update(vo);
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
	public List<ReservVO> getReservList(String cmd) {
		if (cmd == "1") {
			return rss.getBeforeList();
		} else if (cmd == "2") {
			return rss.getTodayList();

		} else if (cmd == "3") {
			return rss.getRoomOneList();

		} else if (cmd == "4") {
			return rss.getRoomTwoList();

		} else if (cmd == "5") {
			return rss.getRoomThreeList();
		} else {
			return null;
		}
	}

	@Override
	public List<ReservVO> getReservList() {
		// TODO Auto-generated method stub
		return rss.getReservList();
	}

	@Override
	public int getDuplicateCheck(ReservVO vo) {
		// TODO Auto-generated method stub
		return rss.getDuplicateCheck(vo);
	}

	@Override
	public List<Map<String, Object>> getResultState() {
		return rss.getResultState();
	}
}
