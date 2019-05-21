package com.weaving.biz.reserv.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.weaving.biz.reserv.ReservService;

@Controller
public class ReservController {
	@Autowired
	ReservService service;
	
	//예약현황
	@RequestMapping("/roomReserv_")
	public String list(Model model) {
		model.addAttribute("list",service.getReservList());
		return "room/roomReserv";
	}
}
