package com.weaving.biz.doc.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.weaving.biz.common.Paging;
import com.weaving.biz.doc.DocService;
import com.weaving.biz.doc.DocVO;
import com.weaving.biz.docForm.DocFormService;
import com.weaving.biz.docForm.DocFormVO;
import com.weaving.biz.emp.EmpVO;
import com.weaving.biz.emp.Empservice;

@Controller
public class DocController {
	@Autowired
	DocService docService;
	
	@Autowired
	DocFormService docFormService;

	@Autowired
	Empservice empService;
	//검색메뉴를 위해서 BoardVO를 매개변수를 넣음
	//@RequestParam에서 변수가 searchCondition이 아닐 경우 value로 searchCondition로 지정해줘야한다
	//cond로 변수명을 변경할 경우 value로 value로 searchCondition로 지정해줘야한다
	//@RequestMapping("/docList")
	//public String docList(Model model) {
	@RequestMapping(value="/docList/{empName}/{position}")
	public String docList(@PathVariable String empName, @PathVariable int position, Model model) {
	
		/*
		 * - C : ALL
		   - B : 대리 이상
		   - A : 과장 이상
		   사원 0
		   대리 1
		   과장 2
		   차장 3
		   부장 4
		   대표 5
		 */
		//2초과 S등급
		//2이면 A
		//1이면 B
		//0이면 C
		String lv = "C";
		if (position > 2 ) {
			lv = "S";
		} else if (position == 2 ) {
			lv = "A";
		} else if (position == 1) {
			lv = "B";
		} else {
			lv = "C";
		}

		DocVO vo = new DocVO();
		//vo.setEmpNo(empNo);
		vo.setSecureLevel(lv);

		model.addAttribute("list", docService.getDocList(vo));
		return "approval/docList";

	}
	
	@RequestMapping(value="/docInsert/{empName}/{position}")
	public String docInsert(@PathVariable String empName, @PathVariable int position, Model model) {
		EmpVO evo = new EmpVO(); 
		model.addAttribute("empList", empService.getEmpList(evo));
		model.addAttribute("list", docFormService.getDocFormList());
		return "approval/docInsert";
	}
	/*
	 * empName, positionTitle, position, emp
	 */
	/*
	@RequestMapping("/documentInsert")
	public String documentInsert() {
		return "/approval/documentInsert";
	}*/
}


/*
 * 	//등록폼
	//boardInsertForm URL이 실행된다.
	//BoardWeb에서 Run하고 그다음 /boardInsert 또는 /boardInsertForm 실행하면 페이지가 나온다.
	// boardInsertForm url로 지정하면 boardInsert.jsp로 향하게 된다.
	@RequestMapping("/boardList")
	//검색메뉴를 위해서 BoardVO를 매개변수를 넣음
	//@RequestParam에서 변수가 searchCondition이 아닐 경우 value로 searchCondition로 지정해줘야한다
	//cond로 변수명을 변경할 경우 value로 value로 searchCondition로 지정해줘야한다
	public String boardList(Model model, Paging paging,
			@RequestParam(required=false, defaultValue="TITLE", value="searchCondition") String cond,
			@RequestParam(required=false) String searchKeyword) {
		
		// String searchCondition = request.getParameter("searchCondition");
		// @RequestParam String searchCondition는 위의 주석의 getParameter와 같은 의미이다.
		// 즉 위의 getParameter대신 @RequestParam쓴 것이다. 
		// 어노테이션에 값은 항상 있어야한다. 값이 null이나 타입이 틀리면 에러가 발생한다. 400에러
		BoardVO vo = new BoardVO();
		vo.setSearchCondition(cond);
		vo.setSearchKeyword(searchKeyword);
		//페이징 처리
		
		//전체 건수
		paging.setTotalRecord(service.getBoardCount(vo));
		
		model.addAttribute("list", service.getBoardList(vo));
		return "board";
	}
 */