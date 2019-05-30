package com.weaving.biz.reserv.impl;

import java.util.List;

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
		rss.insert("ReservDAO.insertReserv",vo);
	}
	public void update(ReservVO vo) {
		rss.update("ReservDAO.updateReserv",vo);
	}
	public List<ReservVO> getReservList(){
		return rss.selectList("ReservDAO.selectReservList");
	}
}
