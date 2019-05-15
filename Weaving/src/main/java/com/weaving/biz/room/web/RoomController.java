package com.weaving.biz.room.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.weaving.biz.room.RoomService;

@Controller
public class RoomController {
	@Autowired
	RoomService service;
	
	@RequestMapping("/roomlist")
	public String test() {
		return "room/roomList";
	}
}
