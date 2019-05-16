package com.weaving.biz.emp.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.weaving.biz.emp.EmpVO;
import com.weaving.biz.emp.Empservice;

@Controller
public class EmpController {
	
	@Autowired
	Empservice service;
	
	@RequestMapping("/emplist")
	public String emplist() {
		return "admin/emp/emplist";
	}
	
	@RequestMapping("/insertEmp")
	public String insertEmp(EmpVO vo) {
		System.out.println(vo);
		service.insertEmp(vo);
		return "admin/emp/empinsert";
	}
	
	@RequestMapping("/empinsertForm")
	public String empinsertForm() {
		return "admin/emp/empinsert";
	}
}
