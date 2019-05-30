package com.weaving.biz.email.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.weaving.biz.common.SessionInfo;
import com.weaving.biz.doc.DocListService;
import com.weaving.biz.email.CheckingMails;
import com.weaving.biz.email.EmailService;
import com.weaving.biz.email.EmailVO;
import com.weaving.biz.email.SendEmailService;
import com.weaving.biz.emp.EmpVO;

@Controller
public class EmailController {

	
	@Autowired
	EmailService service;
	
	@Autowired
	SendEmailService emailService;

	// 메일보내기폼
	@RequestMapping("mailForm")
	public String mailForm() {
		return "email/mailForm";
	}
	// 메일발송완료폼
		@RequestMapping("success_email")
		public String success_email() {
			return "email/success_email";
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
	public String send_mail(Model model, HttpSession session) {
		String host = "pop.gmail.com";// change accordingly
		String mailStoreType = "pop3";
		String username = "dohy43@gmail.com";// change accordingly
		String password = "uuioeaxjqhwqerno";// change accordingly
		
		CheckingMails checkingMail = new CheckingMails();
		
		List<EmailVO> list =  checkingMail.check(host, mailStoreType, username, password);
		
		//insert
		
		EmailVO vo = SessionInfo.getInfo(session, "email");
		
		model.addAttribute("email_id", vo.getEmailId());
		model.addAttribute("from_email",vo.getFromEmail());
		model.addAttribute("subject", vo.getSubject());
		model.addAttribute("email_contents", vo.getEmailContents());
		
		 
		
		
	
		// 다시 select ?
		
		
		return "email/view_mail";
	}
	
	

		
	//	EmpVO vo = SessionInfo.getInfo(session, "emp");		
		//model.addAttribute("waitList", service.getWaitDocList(vo.getEmpNo()));
		
		

	// 메일읽기폼
	/*
	 * @RequestMapping("reading_mail") public String reading_mail(Model model) {
	 * 
	 * String host = "pop.gmail.com";// change accordingly String mailStoreType =
	 * "pop3"; String username = "dohy43@gmail.com";// change accordingly String
	 * password = "uuioeaxjqhwqerno";// change accordingly FetchingEmail
	 * fetchingEmail = new FetchingEmail();
	 * 
	 * List<EmailVO> list = fetchingEmail.fetch(host, mailStoreType, username,
	 * password);
	 * 
	 * System.out.println("test: " + list);
	 * 
	 * model.addAttribute("Emailreading", list);
	 * 
	 * return "email/reading_mail"; }
	 */

}
