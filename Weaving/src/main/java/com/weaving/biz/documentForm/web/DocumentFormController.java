package com.weaving.biz.documentForm.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DocumentFormController {

	@RequestMapping("/test")
	public String approvalFormList()
	{
		return "admin/approval/test2";
	}
}
