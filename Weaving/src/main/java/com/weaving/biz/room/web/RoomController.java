package com.weaving.biz.room.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.weaving.biz.board.BoardVO;
import com.weaving.biz.room.RoomService;
import com.weaving.biz.room.RoomVO;

@Controller
public class RoomController {
	@Autowired
	RoomService service;	
	
	
	//회의실인포
	@RequestMapping("/roomlist")
	public String list(Model model) {
		model.addAttribute("list", service.getRoomList());
		return "room/roomList";
	}
	
	@RequestMapping("/roomReservForm")
	public String roomReservForm(@ModelAttribute("roomReserv")RoomVO vo, Model model) {
		return "room/roomReserv";
	}
	//회의실예약
	@RequestMapping(value = "/roomReservInsert", method = RequestMethod.POST)
	public String reserv(RoomVO vo) {
		System.out.println(vo);
		service.insertRoom(vo);
		return "room/roomReserv";
	}
	//회의실예약현황
	@RequestMapping("/roomstatus")
	public String status() {

		return "room/roomStatus";
	}
    
}
