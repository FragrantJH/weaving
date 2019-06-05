package com.weaving.biz.email.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.weaving.biz.common.SessionInfo;
import com.weaving.biz.doc.DocListService;
import com.weaving.biz.email.CheckingMails;
import com.weaving.biz.email.EmailService;
import com.weaving.biz.email.EmailVO;
import com.weaving.biz.email.FetchingEmail;
import com.weaving.biz.email.MessageVO;
import com.weaving.biz.email.SendEmailService;
import com.weaving.biz.emp.EmpVO;

@Controller
public class EmailController {

	@Autowired
	FetchingEmail fetch;
	
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
	public void mailSend(EmailVO vo, HttpServletResponse response
			, @ModelAttribute("searchVO") MessageVO searchVO,
			SessionStatus status, HttpSession hsession) throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		EmpVO empvo =SessionInfo.getInfo(hsession, "emp");
		vo.setCheckTime(new Date());
		vo.setFromEmail(empvo.getEmail());
		vo.setEmpNo(empvo.getEmpNo());
		
		service.insertEmail(vo);
		status.setComplete();
		
		emailService.send(vo, empvo);

		
		PrintWriter out = response.getWriter();
		out.println("<script>alert('메일을 전송하였습니다.'); location.href='mailSend';</script>");

	}

	@RequestMapping("getMailList")
	public void getMail(EmpVO empvo, EmailVO vo ,HttpSession session,HttpServletResponse response
			, @ModelAttribute("searchVO") MessageVO searchVO,
			SessionStatus status, HttpSession hsession) throws Exception  { 
		
		String to = vo.getToEmail();// change accordingly
		String from = vo.getFromEmail(); // change accordingly
		final String username =empvo.getEmail(); // change accordingly
		final String password = empvo.getGmailAppKey(); // change accordingly
		
		
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		empvo =SessionInfo.getInfo(hsession, "emp");
		vo.setCheckTime(new Date());
		vo.setFromEmail(empvo.getEmail());
		vo.setEmpNo(empvo.getEmpNo());
		
		service.insertInbox(vo);
		status.setComplete();
		
		

		
		// 메일 서버에서 조회
		// Session에 저장되어 있는 사용자의 이메일과 이메일 인증키로 메일 조회 하도록
		// DB에 입력하는 서비스 호출		
		// DB에서 다시 조회한 뒤 화면에 뿌려주는 것	
		
	}
	
//	// 메일보기폼
//	@RequestMapping("view_mail")
//	public String send_mail(Model model, HttpSession session) {
//		String host = "pop.gmail.com";// change accordingly
//		String mailStoreType = "pop3";
//		String username = "dohy43@gmail.com";// change accordingly
//		String password = "uuioeaxjqhwqerno";// change accordingly
//		
//		CheckingMails checkingMail = new CheckingMails();
//		
//		List<EmailVO> list =  checkingMail.check(host, mailStoreType, username, password);
//		model.addAttribute("", list);		
		//insert
	//	EmpVO vo = SessionInfo.getInfo(session, "emp");		
	//	model.addAttribute("waitList", service.getWaitEmailList(vo.getEmpNo()));
	//	EmailVO vo = SessionInfo.getInfo(session, "email");
		
//		model.addAttribute("email_id", vo.getEmailId());
//		model.addAttribute("from_email",vo.getFromEmail());
//		model.addAttribute("subject", vo.getSubject());
//		model.addAttribute("email_contents", vo.getEmailContents());
		

		// 다시 select ?
//		
//		return "email/view_mail";
//	}

	
	  @RequestMapping("reading_mail") 
	  public String reading_mail(Model model, 
			  EmpVO empvo, 
			  EmailVO vo ,
			  HttpSession session,
			 MessageVO messagevo) throws Exception {
		  
		  	String host = "pop.gmail.com";// change accordingly
		  	//String pop3Host = "pop.gmail.com";// change accordingly 
		  	String mailStoreType ="pop3"; 
	  
		  	empvo=SessionInfo.getInfo(session, "emp");	
	  
		  final String user =empvo.getEmail(); // change accordingly
		  final String password = empvo.getGmailAppKey(); // change accordingly
	 
	  
		fetch.fetchEmailFromServer(host, mailStoreType, user, password);
		
	  	model.addAttribute("readingMail", service.getEmailList(messagevo));
	  return "email/reading_mail" ;
	  
	  }
	 
	  
	  /*
		 * 개인메일 목록 출력하는 핸들러
		 */
		@RequestMapping("readone")
		public String selectMailsList(
				@ModelAttribute("searchVO") 
		MessageVO searchVO,HttpSession hsession, ModelMap model, MessageVO mvo) throws Exception {
			
			EmpVO empvo = (EmpVO) hsession.getAttribute("employees");
			searchVO.setEmpNo(empvo.getEmpNo());
			
			
			List<?> emailList=service.getEmailList(mvo);
			model.addAttribute("resultList", emailList);
			
			return "/mail/mailGet";
			}
				

	
}
