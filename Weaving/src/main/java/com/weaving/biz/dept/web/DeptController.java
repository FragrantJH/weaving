package com.weaving.biz.dept.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weaving.biz.dept.DeptService;
import com.weaving.biz.dept.DeptVO;


@Controller
public class DeptController {
	
	@Autowired
	DeptService service;
	
	@RequestMapping(value="/deptlist",method=RequestMethod.GET)
	@ResponseBody
	public List<DeptVO> getDeptList(Model model, DeptVO vo){
		return service.getDeptList(vo);
	}
	
	//리스트 페이지 이동
			@RequestMapping("/deptListFrom")
			public String deptListFrom() {
				return "admin/dept/deptlist";
	}
			
	/*
	 * //dept 수정
	 * 
	 * @RequestMapping(value="/deptUpdate")
	 * 
	 * @ResponseBody public DeptVO updateDept(DeptVO vo, Model model) {
	 * System.out.println("==========================="+vo); service.updateDept(vo);
	 * return vo; }
	 */
	//dept 수정
	@RequestMapping(value="/deptUpdate"
			//,method= {RequestMethod.PUT,RequestMethod.GET}
			,headers = {"Content-type=application/json"}
	)
	@ResponseBody
	public DeptVO updateDept(@RequestBody DeptVO vo, Model model) {
		service.updateDept(vo);
		return vo;
	}
	
	//dept 등록
	@RequestMapping(value="/deptInsert"
			//,method= {RequestMethod.POST,RequestMethod.GET}
			,headers = {"Content-type=application/json"}
	)
	@ResponseBody
	public DeptVO insertDept(@RequestBody DeptVO vo, Model model) {
		service.insertDept(vo);
		return vo;
	}
	
	//dept 단건조회
	@RequestMapping(value="/getDept/{deptId}",method=RequestMethod.GET)
	@ResponseBody
	public DeptVO getDept(@PathVariable String deptId, DeptVO vo, Model model) {
		vo.setDeptId(deptId);
		return service.getDept(vo);
	}
	//삭제
	@RequestMapping(value="/deleteDept/{deptId}", method= {RequestMethod.DELETE,RequestMethod.GET})
	@ResponseBody
	public Map deleteDept( @PathVariable String deptId, DeptVO vo, Model model) {
		vo.setDeptId(deptId);
		service.deleteDept(vo);
		Map result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	} 

}
