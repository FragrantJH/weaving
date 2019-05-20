package com.weaving.biz.dept.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weaving.biz.dept.DeptService;
import com.weaving.biz.dept.DeptVO;

@Service("deptService")
public class DeptServiceImpl implements DeptService {
	
	@Autowired
	DeptDAO mybatis;

	@Override
	public void insertDept(DeptVO vo) {
		mybatis.insertDept(vo);

	}

	@Override
	public void updateDept(DeptVO vo) {
		mybatis.updateDept(vo);

	}

	@Override
	public void deleteDept(DeptVO vo) {
		mybatis.deleteDept(vo);

	}

	@Override
	public DeptVO getDept(DeptVO vo) {
		return mybatis.getDept(vo);
	}

	@Override
	public List<DeptVO> getDeptList(DeptVO vo) {
		return mybatis.getDeptList(vo);
	}

	@Override
	public int getDeptCount(DeptVO vo) {
		return 0;
	}

}
