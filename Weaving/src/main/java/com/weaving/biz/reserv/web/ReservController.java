package com.weaving.biz.reserv.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.weaving.biz.cal.CalVO;
import com.weaving.biz.emp.EmpVO;
import com.weaving.biz.reserv.ReservService;
import com.weaving.biz.reserv.ReservVO;

@Controller
public class ReservController {

	@Autowired
	ReservService service;

	// 예약현황
	@RequestMapping("/roomReserv")
	public String roomReserv(Model model) {
		model.addAttribute("list", service.getReservList());
		return "room/roomReserv";
	}

	@RequestMapping(value = "/roomInsertReserv", method = RequestMethod.POST)
	public String roomInsertReserv(Model model, ReservVO vo, HttpSession session) {
		System.out.println(vo.getReservDate());
		vo.setReservId(0);
		
		vo.setStartDate(vo.getReservDate() + " " + vo.getStartTime());
		vo.setEndDate(vo.getReservDate() + " " + vo.getEndTime());
		
		System.out.println(vo);
		
		// 현재 접속한 사용자 정보
		
		Object emp = session.getAttribute("emp");
		if (emp != null) {
			vo.setEmpNo(((EmpVO) emp).getEmpNo());
		} else {
			vo.setEmpNo(1);
		}
		System.out.println(vo);
		int duplicateCheck = service.getDuplicateCheck(vo);
		boolean b = false;
		if (duplicateCheck > 0) {
			b = true;
		} else {
			service.insertReserv(vo);
		}
		model.addAttribute("check", b);
		model.addAttribute("list", service.getReservList());
		return "room/roomReserv";
	}

	@RequestMapping("/updateReserv")
	@ResponseBody
	public ReservVO modifyReserv(@RequestBody ReservVO vo, HttpSession session) {
		System.out.println(vo);

		vo.setStartDate(vo.getReservDate() + " " + vo.getStartTime());
		vo.setEndDate(vo.getReservDate() + " " + vo.getEndTime());
		System.out.println("********************************************************");
		System.out.println(vo.getStartDate());
		System.out.println(vo.getEndDate());
		System.out.println(vo.getReservDate());
		System.out.println(vo.getDescription());
		System.out.println("********************************************************");
		// 현재 접속한 사용자 정보
		// TODO 임시로 1번 넣은 것 수정 필요
		Object emp = session.getAttribute("emp");
		if (emp != null) {
			vo.setEmpNo(((EmpVO) emp).getEmpNo());
		} else {
			vo.setEmpNo(1);
		}

		service.updateReserv(vo);
		return vo;
	}

	// 중복체크

}
