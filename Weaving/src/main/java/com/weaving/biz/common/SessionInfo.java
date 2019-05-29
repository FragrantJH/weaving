package com.weaving.biz.common;

import javax.servlet.http.HttpSession;

import com.weaving.biz.emp.EmpVO;

public class SessionInfo {
	
	/***
	 * 현재 접속중인 사용자 정보를 가져온다
	 * @param session 세션
	 * @return EmpVO 객체
	 */
	@SuppressWarnings("unchecked")
	public static <T> T getInfo(HttpSession session, String key) {
		
		Object obj = session.getAttribute(key);
		if(obj != null) {
			return (T)obj;
		} else {
			return null;
		}
	}
}
