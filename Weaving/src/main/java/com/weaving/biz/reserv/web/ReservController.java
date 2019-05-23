package com.weaving.biz.reserv.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weaving.biz.cal.CalVO;
import com.weaving.biz.emp.EmpVO;
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
	public String roomInsertReserv(Model model,ReservVO vo, HttpSession session ) {
		
		vo.setStartDate(vo.getReservDate() + " " + vo.getStartTime());
		vo.setEndDate(vo.getReservDate() + " " + vo.getEndTime());
		// 현재 접속한 사용자 정보
		Object emp = session.getAttribute("emp");
		if(emp != null) {
			vo.setEmpNo(((EmpVO)emp).getEmpNo());
		}
		
		service.insertReserv(vo);
		model.addAttribute("list",service.getReservList());
		return "room/roomReserv";
	}
	
	@RequestMapping("/updateReserv")
	@ResponseBody
	public String modifyReserv(@RequestBody ReservVO vo, HttpSession session) {
		System.out.println(vo);
		service.updateReserv(vo);
		return null;
	}
	
}
