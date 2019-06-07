package com.weaving.biz.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {

	@RequestMapping("getChatEmpList")
	public String getCal() {
		
		return "empty/chatEmpList";
	}

}
