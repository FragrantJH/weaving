package com.weaving.biz.dept.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weaving.biz.dept.DeptService;
import com.weaving.biz.dept.DeptVO;

@Service("deptService")
public class DeptServiceImpl implements DeptService {
	
	@Autowired
	DeptDAO dept;

	@Override
	public void insertDept(DeptVO vo) {
		dept.insertDept(vo);

	}

	@Override
	public void updateDept(DeptVO vo) {
		dept.updateDept(vo);

	}

	@Override
	public void deleteDept(DeptVO vo) {
		dept.deleteDept(vo);

	}

	@Override
	public DeptVO getDept(DeptVO vo) {
		return dept.getDept(vo);
	}

	@Override
	public List<DeptVO> getDeptList(DeptVO vo) {
		return dept.getDeptList(vo);
	}

	@Override
	public int getDeptCount(DeptVO vo) {
		return 0;
	}

}
