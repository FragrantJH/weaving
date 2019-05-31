package com.weaving.biz.emp.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import com.weaving.biz.common.EgovFileScrty;
import com.weaving.biz.emp.EmpVO;
import com.weaving.biz.emp.Empservice;

@Service("empService")
public class EmpServiceImpl implements Empservice {

	@Autowired EmpDAO dao;
	
	
	@Override
	public void insertEmp(EmpVO vo) {
		dao.insertEmp(vo);
		/*
		String enpassword;
		try {
			enpassword = EgovFileScrty.encryptPassword(vo.getPassword(), Integer.toString(vo.getEmpNo()));
			vo.setPassword(enpassword);
			dao.insertEmp(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
	}
	
	@Override
	public void updateDelEmp(EmpVO vo) {
		dao.updateDelEmp(vo);
	}
	

	@Override
	public void updateEmp(EmpVO vo) {
		dao.updateEmp(vo);
		/*
		String enpassword;
		try {
			enpassword = EgovFileScrty.encryptPassword(vo.getPassword(), Integer.toString(vo.getEmpNo()));
			vo.setPassword(enpassword);
			dao.updateEmp(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/

	}

	@Override
	public void deleteEmp(EmpVO vo) {
		dao.deleteEmp(vo);

	}

	@Override
	public EmpVO getEmp(EmpVO vo) {
		return dao.getEmp(vo); 
		/*
		 String enpassword; 
		 try { 
			 enpassword = EgovFileScrty.encryptPassword(vo.getPassword(), Integer.toString(vo.getEmpNo())); 
			 vo.setPassword(enpassword); 
			 return dao.getEmp(vo); 
			 } 
		 catch (Exception e) {
			 // TODO Auto-generated catch block
		 e.printStackTrace(); 
		 return null; 
		 }
		 */
		 
	}
	@Override
	public EmpVO getReadyEmpNo(EmpVO vo) {
		return dao.getReadyEmpNo(vo);
	}
	
	@Override
	public EmpVO getEmpl(EmpVO vo) {
		return dao.getEmpl(vo);
	}

	@Override
	public List<EmpVO> getEmpList(EmpVO vo) {
		return dao.getEmpList(vo);
	}

	@Override
	public int getEmpCount(EmpVO vo) {
		return dao.getEmpCount(vo);
	}
	@Override
	public List<Map> insertExcelTest(List<EmpVO> list) {
		return dao.insertExcelTest(list);
	}

}
