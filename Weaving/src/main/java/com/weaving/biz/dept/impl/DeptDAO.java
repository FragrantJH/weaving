package com.weaving.biz.dept.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weaving.biz.dept.DeptVO;

@Repository
public class DeptDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	public void insertDept(DeptVO vo) {
		System.out.println(vo);
		mybatis.insert("DeptDAO.insertDept",vo);
	}
	
	public void updateDept(DeptVO vo) {
		System.out.println(vo);
		mybatis.update("DeptDAO.updateDept",vo);
	}
	
	public void deleteDept(DeptVO vo) {
		System.out.println(vo);
		mybatis.delete("DeptDAO.deleteDept",vo);
	}
	
	public DeptVO getDept(DeptVO vo) {
		return (DeptVO)mybatis.selectOne("DeptDAO.getDept",vo);
	}
	
	public List<DeptVO> getDeptList(DeptVO vo) {
		return mybatis.selectList("DeptDAO.getDeptList",vo);
	}
}
