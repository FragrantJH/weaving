package com.weaving.biz.emp.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weaving.biz.emp.EmpVO;

@Repository
public class EmpDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	public void insertEmp(EmpVO vo) {
		System.out.println(vo);
		mybatis.insert("EmpDAO.insertEmp",vo);
	}
	
	public void updateEmp(EmpVO vo) {
		mybatis.update("EmpDAO.updateEmp",vo);
	}
	
	public void deleteEmp(EmpVO vo) {
		mybatis.delete("EmpDAO.deleteEmp",vo);
	}
	
	public EmpVO getEmp(EmpVO vo) {
		return (EmpVO)mybatis.selectOne("EmpDAO.getEmp",vo);
	}
	
	public List<EmpVO> getEmpList(EmpVO vo) {
		return mybatis.selectList("EmpDAO.getEmpList",vo);
	}
	
	public int getEmpCount(EmpVO vo) {
		return mybatis.selectOne("EmpDAO.getEmpCount", vo);
	}

}
