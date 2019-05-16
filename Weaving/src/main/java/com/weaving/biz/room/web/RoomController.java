package com.weaving.biz.room.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.weaving.biz.room.RoomService;

@Controller
public class RoomController {
	@Autowired
	RoomService service;
	
	//회의실인포
	@RequestMapping("/roomlist")
	public String list() {
	
		return "room/roomList";
	}
	//회의실예약
	@RequestMapping("/roomreserv")
	public String reserv() {
		
		return "room/roomReserv";
	}
	//회의실예약현황
	@RequestMapping("/roomstatus")
	public String status() {
		
		return "room/roomStatus";
	}
    
}
