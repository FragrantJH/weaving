package com.weaving.biz.reserv.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weaving.biz.reserv.ReservVO;

@Repository
public class ReservDAO {

	@Autowired
	public SqlSessionTemplate rss;

	public void insert(ReservVO vo) {
		System.out.println(vo);
		rss.insert("ReservDAO.insertReserv", vo);
	}

	public void update(ReservVO vo) {
		rss.update("ReservDAO.updateReserv", vo);
	}

	public List<ReservVO> getBeforeList() {
		return rss.selectList("ReservDAO.beforeReservList");
	}
	
	public List<ReservVO> getTodayList() {
		return rss.selectList("ReservDAO.todayReservList");
	}
	
	public List<ReservVO> getRoomOneList() {
		return rss.selectList("ReservDAO.roomOneReservList");
	}
	
	public List<ReservVO> getRoomTwoList() {
		return rss.selectList("ReservDAO.roomTwoReservList");
	}
	
	public List<ReservVO> getRoomThreeList() {
		return rss.selectList("ReservDAO.roomThreeReservList");
	}
	
	public List<ReservVO> getReservList() {
		return rss.selectList("ReservDAO.selectReservList");
	}
	public List<Map<String, Object>> getResultState() {
		return rss.selectList("ReservDAO.getReserveCount");
	}
	
	public int getDuplicateCheck(ReservVO vo){
		return rss.selectOne("ReservDAO.duplicatecheck", vo);
	}
}
