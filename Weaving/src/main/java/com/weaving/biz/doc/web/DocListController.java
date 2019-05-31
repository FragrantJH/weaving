package com.weaving.biz.doc.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.weaving.biz.common.SessionInfo;
import com.weaving.biz.doc.DocListService;
import com.weaving.biz.doc.DocListType;
import com.weaving.biz.emp.EmpVO;

@Controller
public class DocListController {

	@Autowired
	DocListService service;

	@RequestMapping("docList")
	public ModelAndView getDocList(@ModelAttribute("listType") DocListType docListType, ModelAndView mv, HttpSession session) {

		mv.clear();
		EmpVO vo = SessionInfo.getInfo(session, "emp");
		session.setAttribute("docListType", docListType);
		
		switch (docListType) {
		case TEMP:
			mv.addObject("docList", service.getTempDocList(vo.getEmpNo()));
			mv.setViewName("approval/docTempList");
			break;
		case WAIT:
			mv.addObject("docList", service.getWaitDocList(vo.getEmpNo()));
			mv.setViewName("approval/docWaitList");
			break;
		case RETURN:
			mv.addObject("docList", service.getReturnDocList(vo.getEmpNo()));
			mv.setViewName("approval/docReturnList");
			break;
		case DONE:
			mv.addObject("docList", service.getDoneDocList(vo.getEmpNo()));
			mv.setViewName("approval/docDoneList");
			break;
		case ING:
			mv.addObject("docList", service.getIngDocList(vo.getEmpNo()));
			mv.setViewName("approval/docIngList");
			break;
		default:
			break;
		}

		return mv;
	}
}
