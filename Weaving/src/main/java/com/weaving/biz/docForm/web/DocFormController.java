package com.weaving.biz.docForm.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.weaving.biz.common.Paging;
import com.weaving.biz.docForm.DocFormService;
import com.weaving.biz.docForm.DocFormVO;

@Controller
@SessionAttributes("docForm")
public class DocFormController {

	@Autowired
	DocFormService service;

	// 등록폼 페이지로 이동
	@RequestMapping("/docFormInsertForm")
	public String docFormInsertForm() {
		return "admin/docForm/docFormInsert";
	}

	// 등록처리
	@RequestMapping("/docFormInsert")
	public String docFormInsert(DocFormVO vo) {
		service.insertDocForm(vo);
		return "redirect:docFormList";
	}

	// 수정처리
	@RequestMapping(value = "/docFormUpdate/{formID}", method = RequestMethod.GET)
	public String docFormUpdateForm(DocFormVO vo, @PathVariable Integer formId, Model model) {
		vo.setFormId(formId);
		model.addAttribute("docForm", service.getDocForm(vo));
		return "docFormUpdate";
	}

	@RequestMapping(value = "/docFormUpdate", method = RequestMethod.POST)
	public String docFormUpdate(@ModelAttribute("docForm") DocFormVO vo, SessionStatus st) {
		System.out.println("===========확인: " + vo);
		service.updateDocForm(vo);
		// cleanup: invalidate 하면 파일을 다 지우는 거고,
		// cleanup하면 이 페이지에서 설정한 @SessionAttributes("board") 정보만 삭제 됨
		st.setComplete();
		return "redirect:docFormList";
	}

	@RequestMapping("/docFormList")
	public ModelAndView documentFormList(ModelAndView mv, Paging paging) {
		// 페이지번호 파라미터
		if (paging.getPage() == 0) {
			paging.setPage(1);
		}

		DocFormVO vo = new DocFormVO();
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		// 전체 건수
		paging.setTotalRecord(service.getDocFormTotalCount());

		System.out.println("Paging: " + paging);

		List<DocFormVO> list = service.getDocFormList(vo);

		mv.addObject("paging", paging);
		mv.addObject("docFormList", list);
		mv.setViewName("admin/docForm/docFormList");

		return mv;
	}
}
