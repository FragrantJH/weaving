package com.weaving.biz.doc.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.weaving.biz.common.SessionInfo;
import com.weaving.biz.doc.DocListService;
import com.weaving.biz.emp.EmpVO;

@Controller
public class DocListController {
	
	@Autowired
	DocListService service;
	
	@RequestMapping("docDoneList")
	public String getDocDoneList(Model model, HttpSession session) {
		
		EmpVO vo = SessionInfo.getInfo(session, "emp");		
		model.addAttribute("doneList", service.getDoneDocList(vo.getEmpNo()));
		
		return "approval/docDoneList";
	}
	
	@RequestMapping("docWaitList_")
	public String getWaitList(Model model, HttpSession session) {
		
		EmpVO vo = SessionInfo.getInfo(session, "emp");		
		model.addAttribute("waitList", service.getWaitDocList(vo.getEmpNo()));
		
		return "approval/docWaitList";
	}
}
