package com.weaving.biz.reserv.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.weaving.biz.reserv.ReservService;
import com.weaving.biz.reserv.ReservVO;

@Controller
public class ReservController {
	@Autowired
	ReservService service;

	//예약현황
	@RequestMapping("/roomReserv")
	public String roomReserv(Model model) {
		model.addAttribute("list",service.getReservList());
		return "room/roomReserv";
	}
	
	@RequestMapping("/roomInsertReserv")
	public String roomInsertReserv(Model model,ReservVO vo) {
		service.insertReserv(vo);
		model.addAttribute("list",service.getReservList());
		return "room/roomReserv";
	}
	
}
