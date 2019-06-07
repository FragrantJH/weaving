package com.weaving.biz.common;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class SessionListener
 *
 */
@WebListener
public class SessionListener implements HttpSessionListener, ServletContextListener {

	public final static String LOGIN_LIST = "LOGIN_LIST";
	public static ServletContext context;

	/***
	 * 세션을 체크해보고 없으면 추가해준다
	 * 
	 * @param newSession
	 */
	public static void checkSession(HttpSession newSession) {
		Set<HttpSession> loginSet = (Set<HttpSession>) context.getAttribute(LOGIN_LIST);
		for (HttpSession s : loginSet) {
			if (s.getId().equals(newSession.getId())) {
				return;
			}
		}

		loginSet.add(newSession);
		context.setAttribute(LOGIN_LIST, loginSet);
	}

	/**
	 * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
	 */
	public void sessionCreated(HttpSessionEvent se) {

		System.out.println(">>>>>>>>>>>>>>>> 세션 생성");
		Set<HttpSession> loginSet = (Set<HttpSession>) context.getAttribute(LOGIN_LIST);

		loginSet.add(se.getSession());

		System.out.println("==============[세션 목록]==============");
		for (HttpSession session : loginSet) {
			System.out.println("sessionId " + session.getId());
			System.out.println("emp Info " + session.getAttribute("emp"));
		}

		context.setAttribute(LOGIN_LIST, loginSet);
	}

	/**
	 * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
	 */
	public void sessionDestroyed(HttpSessionEvent se) {
		System.out.println(">>>>>>>>>>>>>>>> 세션 제거");

		Set<HttpSession> loginSet = (Set<HttpSession>) context.getAttribute(LOGIN_LIST);
		loginSet.remove(se.getSession());
		context.setAttribute(LOGIN_LIST, loginSet);
	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent sce) {
		context = null;

		// TODO : application 종료 될 때 Atrribute값 삭제해줘야 하나? 자동 삭제 ?
	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent sce) {
		Set<HttpSession> userSet = new HashSet<HttpSession>();
		context = sce.getServletContext();
		context.setAttribute(LOGIN_LIST, userSet);
	}

}
