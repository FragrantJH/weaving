package com.weaving.biz.cal.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weaving.biz.cal.CalVO;
import com.weaving.biz.common.CommonDateParser;
import com.weaving.biz.cal.CalService;

@Controller
public class CalController {

	@Autowired
	CalService service;

	@RequestMapping("getCal")
	public String getCal() {
		return "cal/commonCal";
	}

	@RequestMapping(value="calData", method= RequestMethod.GET)
	@ResponseBody
	public List<CalVO> getCalData() {
		CalVO vo = new CalVO();
		List<CalVO> list = service.getCalList(vo);
		for(CalVO data : list) {
			data.setStart(CommonDateParser.parseToHtmlFormat(data.getStart()));
			data.setEnd(CommonDateParser.parseToHtmlFormat(data.getEnd()));
		}
		
		System.out.println(list);
		
		return list;
	}

	@RequestMapping(value = "calData", method = RequestMethod.POST, headers = { "Content-type=application/json" })
	@ResponseBody
	public CalVO insertCal(@RequestBody CalVO vo, Model model) {

		// to
		vo.setStart(CommonDateParser.parseToJavaFormat(vo.getStart()));
		vo.setEnd(CommonDateParser.parseToJavaFormat(vo.getEnd()));
		service.insertCal(vo);
		
		System.out.println("inserted id : " + vo.getId());
		
		return vo;
	}

}
