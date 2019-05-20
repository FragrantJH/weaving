package com.weaving.biz.cal.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.weaving.biz.cal.CalService;

@Controller
public class CalController {

	@Autowired
	CalService service;
	
	@RequestMapping("getCal")
	public String test() {
		return "/cal/commonCal";
	}
	
}
