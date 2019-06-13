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

		Set<HttpSession> loginSet = (Set<HttpSession>) context.getAttribute(LOGIN_LIST);
		
		loginSet.add(se.getSession());
		context.setAttribute(LOGIN_LIST, loginSet);
	}

	/**
	 * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
	 */
	public void sessionDestroyed(HttpSessionEvent se) {

		Set<HttpSession> loginSet = (Set<HttpSession>) context.getAttribute(LOGIN_LIST);
		loginSet.remove(se.getSession());
		context.setAttribute(LOGIN_LIST, loginSet);
	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent sce) {
		context = null;
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
