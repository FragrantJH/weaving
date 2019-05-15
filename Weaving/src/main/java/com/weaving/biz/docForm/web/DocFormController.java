package com.weaving.biz.docForm.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.weaving.biz.common.Paging;
import com.weaving.biz.docForm.DocFormSearchVO;
import com.weaving.biz.docForm.DocFormService;
import com.weaving.biz.docForm.DocFormVO;

@Controller
public class DocFormController {

	@Autowired
	DocFormService service;

	@RequestMapping("/test")
	public String test() {
		return "admin/documentForm/test2";
	}

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

	@RequestMapping("/docFormList")
	public ModelAndView documentFormList(ModelAndView mv, Paging paging) {
		// 페이지번호 파라미터
		if (paging.getPage() == null) {
			paging.setPage(1);
		}

		DocFormSearchVO vo = new DocFormSearchVO();
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
