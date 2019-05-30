package com.weaving.biz.emp.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.weaving.biz.common.SessionInfo;
import com.weaving.biz.emp.EmpVO;

// 로그인처리를 담당하는 인터셉터
public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

	// preHandle() : 컨트롤러보다 먼저 수행되는 메서드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		StringBuffer geturl = new StringBuffer(request.getRequestURL());
		String strurl = geturl.toString();

		EmpVO emp = SessionInfo.getInfo(request.getSession(), "emp");

		if (emp == null || (strurl.matches(".*admin.*") && emp.getAdminYn() == false)) {
			// 로그인 정보 없으면 로그인 페이지로 이동
			response.sendRedirect("/weaving/login");
			return false;
		} else {
			return true;
		}
	}

	private String valueof(StringBuffer geturl) {
		// TODO Auto-generated method stub
		return null;
	}

	// 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

}