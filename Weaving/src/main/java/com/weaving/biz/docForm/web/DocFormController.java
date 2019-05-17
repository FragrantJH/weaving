package com.weaving.biz.docForm.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
public class DocFormController {

	@Autowired
	DocFormService service;

	// 등록폼 페이지로 이동
	@RequestMapping("/docFormInsertForm")
	public String docFormInsertForm(@ModelAttribute("docForm") DocFormVO vo, Model model) {
		vo.setFormId(-1);
		return "admin/docForm/docFormInsert";
	}

	@RequestMapping("/showDocForm/{formId}")
	public String docFormViewForm(@ModelAttribute("docForm") DocFormVO vo, @PathVariable Integer formId, Model model) {
		vo.setFormId(formId);
		model.addAttribute("docForm", service.getDocForm(vo));
		return "admin/docForm/docFormView";
	}

	// 수정처리폼 페이지 이동
	@RequestMapping(value = "/docFormUpdate/{formId}", method = RequestMethod.POST)
	public String docFormUpdateForm(DocFormVO vo, @PathVariable Integer formId, Model model) {
		vo.setFormId(formId);
		model.addAttribute("docForm", service.getDocForm(vo));
		return "admin/docForm/docFormInsert";
	}

	// 등록/수정 처리
	@RequestMapping(value = "/docFormInsert", method = RequestMethod.POST)
	public String docFormInsert(DocFormVO vo) {
		if (vo.getFormId() == -1)
			service.insertDocForm(vo);
		else
			service.updateDocForm(vo);
		return "redirect:docFormList";
	}

	// 삭제 처리
	@RequestMapping(value = "/docFormDelete", method = RequestMethod.GET)
	public String deleteDocForm(DocFormVO vo, HttpServletRequest request) {
		vo.setFormId(Integer.parseInt(request.getParameter("formId")));
		service.deleteDocForm(vo);
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
		List<DocFormVO> list = service.getDocFormList(vo);

		mv.addObject("paging", paging);
		mv.addObject("docFormList", list);
		mv.setViewName("admin/docForm/docFormList");

		return mv;
	}
}
