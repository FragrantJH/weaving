package com.weaving.biz.docForm.web;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

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
	public void docFormInsert(DocFormVO vo) {
		service.insertDocForm(vo);
	}

	@RequestMapping("/docFormList")
	public String documentFormList() {
		return "admin/documentForm/documentFormList";
	}

}
