package com.weaving.biz.emp.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weaving.biz.common.EgovFileScrty;
import com.weaving.biz.emp.EmpVO;
import com.weaving.biz.emp.Empservice;

@Service("empService")
public class EmpServiceImpl implements Empservice {

	@Autowired
	EmpDAO dao;

	@Override
	public void insertEmp(EmpVO vo) {
		// dao.insertEmp(vo);

		String enpassword;
		try {
			enpassword = EgovFileScrty.encryptPassword(vo.getPassword(), vo.getEmail());
			vo.setPassword(enpassword);
			dao.insertEmp(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public void updateDelEmp(EmpVO vo) {
		dao.updateDelEmp(vo);
	}

	@Override
	public void updateEmp(EmpVO vo) {
		// dao.updateEmp(vo);

		String enpassword;
		try {
			enpassword = EgovFileScrty.encryptPassword(vo.getPassword(), vo.getEmail());
			vo.setPassword(enpassword);
			dao.updateEmp(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public void deleteEmp(EmpVO vo) {
		dao.deleteEmp(vo);

	}

	@Override
	public EmpVO getEmp(EmpVO vo) {
		// return dao.getEmp(vo);

		String enpassword;
		try {
			enpassword = EgovFileScrty.encryptPassword(vo.getPassword(), vo.getEmail());
			vo.setPassword(enpassword);
			return dao.getEmp(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
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
	public List<EmpVO> getExEmpList(EmpVO vo) {
		return dao.getExEmpList(vo);
	}
	
	@Override
	public List<EmpVO> getExEmpList1(EmpVO vo) {
		return dao.getExEmpList1(vo);
	}

	@Override
	public int getEmpCount(EmpVO vo) {
		return dao.getEmpCount(vo);
	}

	@Override
	public void insertExcelTest(List<EmpVO> list) {
		
		try {
			for (int i = 0; i < list.size(); i++) {
				String enpassword = EgovFileScrty.encryptPassword(list.get(i).getPassword(), list.get(i).getEmail());
				list.get(i).setPassword(enpassword);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		dao.insertExcelTest(list);
	}

	@Override
	public EmpVO emailcheck(EmpVO vo) {
		return dao.emailcheck(vo);
	}

}
