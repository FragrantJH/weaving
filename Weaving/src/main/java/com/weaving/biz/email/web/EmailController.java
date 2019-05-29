package com.weaving.biz.email.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.weaving.biz.email.CheckingMails;
import com.weaving.biz.email.EmailVO;
import com.weaving.biz.email.FetchingEmail;
import com.weaving.biz.email.SendEmailService;

@Controller
public class EmailController {

	
	@Autowired
	SendEmailService emailService;

	// 메일보내기폼
	@RequestMapping("mailForm")
	public String mailForm() {
		return "email/mailForm";
	}

	// 메일발송처리
	@RequestMapping("mailSend")
	public void mailSend(EmailVO vo, HttpServletResponse response) throws IOException {
		emailService.send(vo);
		response.setContentType("text/html; charset=euc-kr");
		response.setCharacterEncoding("euc-kr");
		PrintWriter out = response.getWriter();
		
	}

	// 메일보기폼
	@RequestMapping("view_mail")
	public String send_mail(Model model) {
		String host = "pop.gmail.com";// change accordingly
		String mailStoreType = "pop3";
		String username = "dohy43@gmail.com";// change accordingly
		String password = "uuioeaxjqhwqerno";// change accordingly
		CheckingMails checkingMail = new CheckingMails();
		
		List<EmailVO> list =  checkingMail.check(host, mailStoreType, username, password);

		model.addAttribute("EmailList", list);
		
		return "email/view_mail";
	}

	// 메일읽기폼
	@RequestMapping("reading_mail")
	public String reading_mail(Model model) {
		String host = "pop.gmail.com";// change accordingly
		String mailStoreType = "pop3";
		String username = "dohy43@gmail.com";// change accordingly
		String password = "uuioeaxjqhwqerno";// change accordingly
		FetchingEmail fetchingEmail = new FetchingEmail();
		  

		model.addAttribute("Emailreading");
		
		return "email/reading_mail";
	}

}
