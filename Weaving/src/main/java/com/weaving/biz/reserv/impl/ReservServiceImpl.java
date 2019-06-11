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
		if ("1".equals(cmd)) {
			System.out.println("ddddddddddddddddddddddddddddddddddddddddddddd");
			System.out.println(cmd);
			System.out.println("dddddddddddddddddddddddddddddddddddddasdfsadfsdafsadddddddddddddddddddddddd");
			return rss.getBeforeList();
			
		} else if ("2".equals(cmd)) {
			return rss.getTodayList();

		} else if ("3".equals(cmd)) {
			return rss.getRoomOneList();

		} else if ("4".equals(cmd)) {
			return rss.getRoomTwoList();

		} else if ("5".equals(cmd)) {
			return rss.getRoomThreeList();
		} else {
			System.out.println("ddddddddddddddddddelseelseddddddddddddddddddddddddddd");
			System.out.println(cmd);
			System.out.println("dddddddddddddddddddddddddddddddddddddasdfsadfsdafsadddddddddddddddddddddddd");
			return rss.getReservList();
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
