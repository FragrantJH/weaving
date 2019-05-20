package com.weaving.biz.dept.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weaving.biz.dept.DeptService;
import com.weaving.biz.dept.DeptVO;

public class DeptController {
	@Autowired
	DeptService service;
	
	@RequestMapping(value="/deptlist",method=RequestMethod.GET)
	@ResponseBody
	public List<DeptVO> getDeptList(Model model, DeptVO vo){
		return service.getDeptList(vo);
	}

}
