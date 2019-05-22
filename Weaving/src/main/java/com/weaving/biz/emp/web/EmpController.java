package com.weaving.biz.emp.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.weaving.biz.emp.EmpVO;
import com.weaving.biz.emp.Empservice;

@Controller
public class EmpController {

	@Autowired
	Empservice service;
	//리스트 페이지 이동
	@RequestMapping("/emplist")
	public String emplist() {
		return "admin/emp/emplist";
	}
	//Emp 전체 조회
	@RequestMapping(value="/emplist1",method=RequestMethod.GET )
	@ResponseBody
	public List<EmpVO> getUserList(Model model, EmpVO vo){
		return service.getEmpList(vo);
	}
	
	//단건조회
	@RequestMapping(value="/getEmpl/{empNo}",  method=RequestMethod.GET)
	@ResponseBody
	public EmpVO getUser(@PathVariable int empNo, EmpVO vo, Model model) {
		vo.setEmpNo(empNo);
		return  service.getEmp(vo);
		}
		
	//삭제
	@RequestMapping(value="/deleteEmp/{empNo}", method=RequestMethod.DELETE)
	@ResponseBody
	public Map deleteEmp( @PathVariable int empNo, EmpVO vo, Model model) {
		vo.setEmpNo(empNo);
		service.deleteEmp(vo);
		Map result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}  
	
	//등록
	@RequestMapping(value="/insertEmp"
			,method= {RequestMethod.POST,RequestMethod.GET}
			,headers = {"Content-type=application/json" }
	)
	@ResponseBody
	public EmpVO insertEmp(@RequestBody EmpVO vo, Model model) {
		service.insertEmp(vo);
		return  vo;
	}
	
	//수정
	@RequestMapping(value="/empUpdate",method= {RequestMethod.PUT,RequestMethod.GET} )
	@ResponseBody
	public EmpVO updateEmp(EmpVO vo, Model model) {
		service.updateEmp(vo);
		return vo;
	}	
		
	@RequestMapping("/showEmp/{empNo}")
	public String empViewForm(@ModelAttribute("EmpForm") EmpVO vo, @PathVariable Integer empNo, Model model) {
		vo.setEmpNo(empNo);
		model.addAttribute("EmpForm",service.getEmp(vo));
		return "admin/emp/empinsert";
	}
	
	//등록폼으로 이동
	@RequestMapping("/empinsertForm")
	public String empinsertForm(@ModelAttribute("EmpForm") EmpVO vo, Model model) {
		return "admin/emp/empinsert";
	}

	// 로그인폼
	@RequestMapping(value = { "/loginForm", "/login" }, method = RequestMethod.GET)
	public String loginForm() {
		return "empty/login";
	}

	// 로그인 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("Emp") EmpVO vo, HttpServletRequest request, HttpSession session,
			HttpServletResponse response) throws IOException {
		// 커맨드 객체는 자동으로 model.addAttribute("emp"vo)
		
		// Admin 계정 체크
		if(vo.getEmpNo() == 1234 && vo.getPassword().equals("admin")) {
			session.setAttribute("adminMode", true);
			return "admin/adminHome";
		}

		// 일반 사용자 계정 체크		
		EmpVO emp = service.getEmp(vo);
		if (emp == null) {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('등록된 사용자 정보가 없습니다');");
			out.print("history.go(-1);");
			out.print("</script>");
			return "empty/login";
		} else {
			session.setAttribute("empName", emp.getEmpName());
			session.setAttribute("position", emp.getPosition());
			session.setAttribute("emp", emp);

		}
		return "home";
	}
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();// 세션 무효화
		return "home";
	}
}
