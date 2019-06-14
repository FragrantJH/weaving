package com.weaving.biz.chat;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weaving.biz.common.SessionInfo;
import com.weaving.biz.common.SessionListener;
import com.weaving.biz.emp.EmpVO;
import com.weaving.biz.emp.Empservice;

@Controller
public class ChatController {

	@Autowired
	Empservice empService;

	@RequestMapping("getChatEmpList")
	public String getCal() {
		return "empty/chatEmpList";
	}

	@RequestMapping("getOnlineEmp")
	@ResponseBody
	public List<EmpVO> getOnlineEmp(Model model, HttpSession session) {

		List<EmpVO> loginEmpList = new ArrayList<EmpVO>();

		@SuppressWarnings("unchecked")
		Set<HttpSession> loginEmp = (Set<HttpSession>) session.getServletContext().getAttribute(SessionListener.LOGIN_LIST);

		EmpVO curEmp = SessionInfo.getInfo(session, "emp");

		// 접속한 사용자와 동일하면 목록에 추가하지 않음
		// 현재 접속 세션에 있는 목록만 출력
		for (HttpSession s : loginEmp) {
			EmpVO emp = SessionInfo.getInfo(s, "emp");
			
			if (emp != null && emp.getEmpNo() != curEmp.getEmpNo()) {
					loginEmpList.add(emp);
			}
		}

		return loginEmpList;
	}

	@RequestMapping("startChat")
	public String startChat(@RequestParam(required = true, value = "toEmpNo") int empNo,
			@RequestParam(required = true, value = "toEmpName") String empName) {
		// 채팅 화면 처리
		return "empty/chat";
	}

}
