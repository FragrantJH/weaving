package com.weaving.biz.emp.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weaving.biz.emp.EmpVO;
import com.weaving.biz.emp.Empservice;

@Service("empService")
public class EmpServiceImpl implements Empservice {

	@Autowired EmpDAO dao;
	
	
	@Override
	public void insertEmp(EmpVO vo) {
		dao.insertEmp(vo);

	}

	@Override
	public void updateEmp(EmpVO vo) {
		dao.updateEmp(vo);

	}

	@Override
	public void deleteEmp(EmpVO vo) {
		dao.deleteEmp(vo);

	}

	@Override
	public EmpVO getEmp(EmpVO vo) {
		return dao.getEmp(vo);
	}

	@Override
	public List<EmpVO> getEmpList(EmpVO vo) {
		return dao.getEmpList(vo);
	}

	@Override
	public int getEmpCount(EmpVO vo) {
		return dao.getEmpCount(vo);
	}

}
