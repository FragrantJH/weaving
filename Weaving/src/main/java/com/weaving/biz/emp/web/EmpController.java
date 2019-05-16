package com.weaving.biz.emp.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.weaving.biz.emp.EmpVO;
import com.weaving.biz.emp.Empservice;

@Controller
public class EmpController {
	
	@Autowired
	Empservice service;
	
	@RequestMapping("/emplist")
	public String emplist() {
		return "admin/emp/emplist";
	}
	
	@RequestMapping("/insertEmp")
	public String insertEmp(EmpVO vo) {
		System.out.println(vo);
		service.insertEmp(vo);
		return "admin/emp/empinsert";
	}
	
	@RequestMapping("/empinsertForm")
	public String empinsertForm() {
		return "admin/emp/empinsert";
	}
	
	//로그인폼
		@RequestMapping(value= {"/loginForm","/login"}, method=RequestMethod.GET)
		public String loginForm() {
			return "admin/emp/login.empty";
		}
		
		//로그인 처리
		@RequestMapping(value="/login", method=RequestMethod.POST)
		public String login(@ModelAttribute("Emp") EmpVO vo,
				HttpServletRequest request, 
				HttpSession session,
				HttpServletResponse response) throws IOException{
			//커맨드 객체는 자동으로 model.addAttribute("emp"vo)
			EmpVO emp = service.getEmp(vo);
			if(emp == null) {
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('id error');");
				out.print("history.go(-1);");
				out.print("</script>");
				return "admin/emp/login";
			}else {
				session.setAttribute("empName", emp.getEmpName());
				session.setAttribute("positionTitle", emp.getPositionTitle());
				session.setAttribute("position", emp.getPosition());
				session.setAttribute("emp", emp);
				
			}
				return "home";
		}

		@RequestMapping("/logout")
		public String logout(HttpSession session) {
			session.invalidate();//세션 무효화
			return "home";
		}
}
