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
	
	ServletContext context;
	
	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent se)  {
    	
    	System.out.println("========= 세션 생성");
    	Set<HttpSession> loginEmp = (Set<HttpSession>)context.getAttribute("loginEmp");
    	
    	loginEmp.add(se.getSession());
    	
    	for(HttpSession session: loginEmp){
			System.out.println("sessionId " + session.getId());
		}
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  { 
    	System.out.println("========= 세션 제거");
    	
    	Set<HttpSession> loginEmp = (Set<HttpSession>)context.getAttribute("loginEmp");
    	
    	loginEmp.remove(se.getSession());
    	
    	for(HttpSession session: loginEmp){
			System.out.println(session);
		}
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
    	System.out.println("========= Application 제거");
        context = null;
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
    	System.out.println("========= Application 생성");
    	Set<HttpSession> userSet = new HashSet<HttpSession>();
    	context = sce.getServletContext();
    	
    	context.setAttribute("loginEmp", userSet);
    }
	
}
