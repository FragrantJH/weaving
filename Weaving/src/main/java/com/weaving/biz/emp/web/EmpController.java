package com.weaving.biz.emp.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.weaving.biz.common.SessionInfo;
import com.weaving.biz.doc.DocListService;
import com.weaving.biz.emp.EmpVO;
import com.weaving.biz.emp.Empservice;
import com.weaving.biz.emp.impl.AdminAccountsMngService;
import com.weaving.biz.reserv.ReservService;

@Controller
public class EmpController {

	@Autowired
	Empservice service;
	@Autowired
	DocListService docListService;
	@Autowired
	ReservService reserveService;
	
	@Inject
	AdminAccountsMngService AdminAccountsMngService;

	// 엑셀 업로드 페이지 이동
	@RequestMapping(value = "/excelUploadPage", method = RequestMethod.GET)
	public String serviceMngForm(Model model, Principal principal) {
		return "admin/emp/excelupload";
	}

	// 엑셀 업로드 처리
	@RequestMapping(value = "/compExcelUpload")
	@ResponseBody
	public List<EmpVO> excelUpload(MultipartHttpServletRequest req) {
		List<EmpVO> list = new ArrayList<EmpVO>();
		// 엑셀 파일이 xls일때와 xlsx일때 서비스 라우팅
		String excelType = req.getParameter("excelType");
		if (excelType.equals("xlsx")) {
			list = AdminAccountsMngService.xlsxExcelReader(req);
		} else if (excelType.equals("xls")) {
			list = AdminAccountsMngService.xlsExcelReader(req);
		}
		return list;
	}

	// 일반 사원 페이지 이동
	@RequestMapping("/pwcheck")
	public String pwcheck(Model model, EmpVO vo, HttpSession session) {
		model.addAttribute("emp", SessionInfo.getInfo(session, "emp"));
		return "emp/passwordCheck";
	}

	// 일반 사원 페이지 이동
	@RequestMapping("/empselect")
	public String empselect(Model model, EmpVO vo, HttpSession session) {
		vo.setEmpNo((Integer) (session.getAttribute("empNo")));
		model.addAttribute("emp", service.getEmp(vo));
		return "emp/emp";
	}

	// admin리스트 페이지 이동
	@RequestMapping("/adminemplist")
	public String emplist() {
		return "admin/emp/emplist";
	}

	// Emp 전체 조회
	@RequestMapping(value = "/emplist1", method = RequestMethod.GET)
	@ResponseBody
	public List<EmpVO> getUserList(Model model, EmpVO vo) {
		return service.getEmpList(vo);
	}

	// 단건조회
	@RequestMapping(value = "/getEmpl/{empNo}", method = RequestMethod.GET)
	@ResponseBody
	public EmpVO getUser(@PathVariable int empNo, EmpVO vo, Model model) {
		vo.setEmpNo(empNo);
		return service.getEmpl(vo);
	}

	// 삭제
	@RequestMapping(value = "/deleteEmp/{empNo}", method = {RequestMethod.DELETE, RequestMethod.GET})
	@ResponseBody
	public Map deleteEmp(@PathVariable int empNo, EmpVO vo, Model model) {
		vo.setEmpNo(empNo);
		service.deleteEmp(vo);
		Map result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}

	// 등록
	@RequestMapping(value = "/insertEmp", method = { RequestMethod.POST, RequestMethod.GET }, headers = {
			"Content-type=application/json" })
	@ResponseBody
	public EmpVO insertEmp(@RequestBody EmpVO vo, Model model) {
		service.insertEmp(vo);
		return vo;
	}

	// 퇴사수정
	@RequestMapping(value = "/empDelUpdate")
	@ResponseBody
	public EmpVO updateDelEmp(EmpVO vo, Model model) {
		System.out.println("===========================" + vo);
		service.updateDelEmp(vo);
		return vo;
	}

	// 수정
	@RequestMapping(value = "/empUpdate")
	@ResponseBody
	public EmpVO updateEmp(EmpVO vo, Model model) {
		System.out.println("===========================" + vo);
		service.updateEmp(vo);
		return vo;
	}

	@RequestMapping("/showEmp/{empNo}")
	public String empViewForm(@ModelAttribute("EmpForm") EmpVO vo, @PathVariable Integer empNo, Model model) {
		vo.setEmpNo(empNo);
		model.addAttribute("EmpForm", service.getEmp(vo));
		return "admin/emp/empinsert";
	}

	// 등록폼으로 이동
	@RequestMapping("/empinsertForm")
	public String empinsertForm(@ModelAttribute("EmpForm") EmpVO vo, Model model) {
		return "admin/emp/empinsert";
	}

	// 로그인폼
	@RequestMapping(value = { "/loginForm", "/login" }, method = RequestMethod.GET)
	public String loginForm() {
		return "empty/login";
	}

	// 로그인 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("Emp") EmpVO vo, HttpServletRequest request, HttpSession session,
			HttpServletResponse response, Model model) throws IOException {
		// 커맨드 객체는 자동으로 model.addAttribute("emp"vo)

		// 일반 사용자 계정 체크
		EmpVO emp = service.getEmp(vo);

		if (emp == null) {
			// TODO : 잘못된 사용자 정보 처리 안되는 것 해결
			/*
			 * PrintWriter out = response.getWriter(); out.print("<script>");
			 * out.print("alert('등록된 사용자 정보가 없습니다');"); out.print("history.go(-1);");
			 * out.print("</script>");
			 */
			return "empty/login";
		} else {

			if (emp.getAdminYn()) {
				session.setAttribute("emp", emp);
				
				// TODO : adminHome 처리
				model.addAttribute("totalIngCount", docListService.getTotalIngCount());
				model.addAttribute("totalReturnCount", docListService.getTotalReturnCount());
				model.addAttribute("totalDoneCount", docListService.getTotalDoneCount());
				model.addAttribute("totalTempCount", docListService.getTotalTempCount());
				model.addAttribute("reserveState", reserveService.getResultState());
				
				return "admin/adminHome";
			} else {
				session.setAttribute("emp", emp);

				// TODO : 해당 정보 emp.XXX 으로 변경 필요
				session.setAttribute("empNo", emp.getEmpNo());
				session.setAttribute("empName", emp.getEmpName());
				session.setAttribute("position", emp.getPosition());

				return "redirect:home";
			}
		}
	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();// 세션 무효화
		return "empty/login";
	}

	// 일반사용자 수정처리
	@RequestMapping("/normalempinsert")
	public String normalempinsert(EmpVO vo) {
		service.updateEmp(vo);
		return "redirect:empselect";
	}
	
	//email check
	@RequestMapping("/emailcheck")
	@ResponseBody
	public int emailcheck(EmpVO vo, ModelAndView mav) {
		int result=0;
		EmpVO emp = service.emailcheck(vo);
		if(emp != null) result=1;
		return result;
	}
	
}
