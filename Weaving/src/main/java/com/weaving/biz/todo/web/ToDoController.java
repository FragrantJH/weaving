package com.weaving.biz.todo.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weaving.biz.todo.ToDoService;
import com.weaving.biz.todo.ToDoVO;

@Controller
public class ToDoController {
	
	@Autowired
	ToDoService service;
	
	//등록처리
	@ResponseBody
	@RequestMapping("/todoInsert")
	public ToDoVO todoInsert(@ModelAttribute ToDoVO vo, HttpSession session) {
		Integer empNo = (Integer) session.getAttribute("empNo");
		vo.setEmpNo(empNo);
		service.insertTodo(vo);
		return vo;
	}
	
	//목록조회
	@RequestMapping("/todoList")
	public List <ToDoVO> todoList(HttpSession session) {
		Integer empNo = (Integer) session.getAttribute("empNo");
		List<ToDoVO> list = service.getTodoList(empNo);
		return list;
	}
	
	//삭제
	@RequestMapping(value = "/todoDelete", method = RequestMethod.GET)
	public String todoDelete(ToDoVO vo, HttpSession session, HttpServletRequest request) {
		service.deleteTodo(vo);
		return "";
	}
}
