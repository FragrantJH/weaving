package com.weaving.biz.cal.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weaving.biz.cal.CalVO;
import com.weaving.biz.common.CommonDateParser;
import com.weaving.biz.cal.CalService;
import com.weaving.biz.cal.CalTypeEnum;

@Controller
public class CalController {

	@Autowired
	CalService service;

	@RequestMapping("getCal")
	public String getCal(@ModelAttribute("cal") CalVO vo) {
		
		System.out.println("getCal: " + vo);
		return "cal/commonCal";
	}

	@RequestMapping(value="calData", method= RequestMethod.GET)
	@ResponseBody
	public List<CalVO> getCalData(CalVO vo, HttpSession session) {
		
		Object calType = session.getAttribute("calType");
		
		// 
		if(calType != null && (CalTypeEnum)calType == CalTypeEnum.User) {
			Object empNo = session.getAttribute("empNo");
			if(empNo != null) {
				vo.setEmpNo((Integer)empNo);
			}
		}
		
		List<CalVO> list = service.getCalList(vo);
		for(CalVO data : list) {
			data.setStart(CommonDateParser.parseToHtmlFormat(data.getStart()));
			data.setEnd(CommonDateParser.parseToHtmlFormat(data.getEnd()));
		}
		
		return list;
	}

	@RequestMapping(value = "calData", method = RequestMethod.POST, headers = { "Content-type=application/json" })
	@ResponseBody
	public CalVO insertCal(@RequestBody CalVO vo) {

		// to
		vo.setStart(CommonDateParser.parseToJavaFormat(vo.getStart()));
		vo.setEnd(CommonDateParser.parseToJavaFormat(vo.getEnd()));
		
		// TODO : 일반 사용자 로그인 시, empNo 값을 입력해줘야 함
		service.insertCal(vo);
		
		System.out.println("inserted id : " + vo.getId());
		
		return vo;
	}
	
	@RequestMapping(value = "calData", method = RequestMethod.PUT, headers = { "Content-type=application/json" })
	@ResponseBody
	public CalVO updateCal(@RequestBody CalVO vo) {

		// to
		vo.setStart(CommonDateParser.parseToJavaFormat(vo.getStart()));
		vo.setEnd(CommonDateParser.parseToJavaFormat(vo.getEnd()));
		service.insertCal(vo);
		
		System.out.println("inserted id : " + vo.getId());
		
		return vo;
	}

}
