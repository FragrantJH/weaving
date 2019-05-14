package com.weaving.biz.emp.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmpController {

	@RequestMapping("/emplist")
	public String emplist() {
		return "admin/emp/emplist";
	}
	
	@RequestMapping("/empinsert")
	public String empinsert() {
		return "admin/emp/empinsert";
	}
}
