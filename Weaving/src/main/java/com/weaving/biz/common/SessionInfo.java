package com.weaving.biz.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.weaving.biz.emp.EmpVO;

public class SessionInfo {
	
	private static SessionInfo instance;
	public static SessionInfo getInstance() {
		if(instance == null) {
			instance = new SessionInfo();
		}
		return instance;
	}

	public EmpVO getLoginUser(HttpSession session) {
		
		Object obj = session.getAttribute("emp");
		if(obj != null) {
			return (EmpVO)obj;
		} else {
			return null;
		}
	}
}
