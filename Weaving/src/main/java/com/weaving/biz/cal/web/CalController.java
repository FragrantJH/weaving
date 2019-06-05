package com.weaving.biz.cal.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weaving.biz.cal.CalVO;
import com.weaving.biz.common.CommonDateParser;
import com.weaving.biz.common.SessionInfo;
import com.weaving.biz.cal.CalService;
import com.weaving.biz.cal.CalTypeEnum;

@Controller
public class CalController {

	@Autowired
	CalService service;

	@RequestMapping("getCal.do")
	public String getCal(@ModelAttribute("cal") CalVO vo, HttpSession session) {
		
		session.setAttribute("calType", vo.getCalType());
		return "cal/calendar";
	}
	
	@RequestMapping("getCalAdmin.do")
	public String getCalAdmin(@ModelAttribute("cal") CalVO vo, HttpSession session) {
		
		session.setAttribute("calType", vo.getCalType());
		return "admin/cal/calendar";
	}

	@RequestMapping(value="calendar", method= RequestMethod.GET)
	@ResponseBody
	public List<CalVO> getCalData(CalVO vo, HttpSession session) {
		
		CalTypeEnum calType = SessionInfo.getInfo(session, "calType");
		
		if(calType != null && calType == CalTypeEnum.USER) {
			Integer empNo = SessionInfo.getInfo(session, "empNo");
			if(empNo != null) {
				vo.setEmpNo(empNo);
			}
		} else {
			vo.setEmpNo(null);
		}
		
		return service.getCalList(vo);
	}

	@RequestMapping(value = "calendar", method = RequestMethod.POST, headers = { "Content-type=application/json" })
	@ResponseBody
	public CalVO insertCal(@RequestBody CalVO vo, HttpSession session) {

		// 날짜 형식 변환
		vo.setStart(CommonDateParser.parseToJavaFormat(vo.getStart()));
		vo.setEnd(CommonDateParser.parseToJavaFormat(vo.getEnd()));
		
		// 캘린더 타입에 따라서 EmpNo 값 vo에 입력
		Object calType = session.getAttribute("calType");
		
		if(calType != null && (CalTypeEnum)calType == CalTypeEnum.USER) {
			Object empNo = session.getAttribute("empNo");
			if(empNo != null) {
				vo.setEmpNo((Integer)empNo);
			}
		} else {
			vo.setEmpNo(null);
		}
		
		service.insertCal(vo);
		
		System.out.println("inserted id : " + vo.getId());
		
		return vo;
	}
	
	@RequestMapping(value = "calendar", method = RequestMethod.PUT, headers = { "Content-type=application/json" })
	@ResponseBody
	public CalVO updateCal(@RequestBody CalVO vo) {

		System.out.println("updateCal: " + vo);
		
		vo.setStart(CommonDateParser.parseToJavaFormat(vo.getStart()));
		vo.setEnd(CommonDateParser.parseToJavaFormat(vo.getEnd()));
		service.updateCal(vo);
		return service.getCal(vo);
	}
	
	@RequestMapping(value = "calendar", method = RequestMethod.DELETE, headers = { "Content-type=application/json" })
	@ResponseBody
	public CalVO deleteCal(@RequestBody CalVO vo) {
		service.deleteCal(vo);
		return vo;
	}

}
