package com.weaving.biz.emp.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// 로그인처리를 담당하는 인터셉터
public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

	// preHandle() : 컨트롤러보다 먼저 수행되는 메서드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println(request.getRequestURL());

		StringBuffer geturl = new StringBuffer(request.getRequestURL());
		System.out.println(geturl);
		String strurl = geturl.toString();
		System.out.println(strurl);

		// url admin
		if (strurl.matches(".*admin.*")) {

			// session.setAttribute("adminMode", true);

			HttpSession session = request.getSession();
			Object objad = session.getAttribute("adminMode");
			System.out.println(objad);
			
			if (objad==null || objad.equals(false)) {
				response.sendRedirect("/weaving/login");
				return false;
			}
			return true;
		}
		// 일반 페이지
		else {
			HttpSession session = request.getSession();
			Object obj = session.getAttribute("emp");

			if (obj == null) {
				response.sendRedirect("/weaving/login");
				return false;
			}
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