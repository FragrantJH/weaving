package com.weaving.biz.documentForm.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DocumentFormController {

	@RequestMapping("/test")
	public String test()
	{
		return "admin/documentForm/test2";
	}
	
	@RequestMapping("/docFormInsert")
	public String documentFormInsert()
	{
		return "admin/documentForm/documentFormInsert";
	}
	
	@RequestMapping("/docFormList")
	public String documentFormList()
	{
		return "admin/documentForm/documentFormList";
	}
	
}
