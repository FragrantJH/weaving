package com.weaving.biz.email.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Server;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.weaving.biz.common.SessionInfo;
import com.weaving.biz.doc.DocListService;
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
		
		//삭제
	@RequestMapping(value ="/meilDelete", method = RequestMethod.GET)
	public String meilDelete(EmailVO vo, HttpSession session, HttpServletRequest request) {
		vo.setInboxid(Integer.parseInt(request.getParameter("inboxid")));
		service.deleteInbox(vo);
		return "email/email_List" ;
	}
	//읽음 처리 
	@RequestMapping(value="updateRCNR")
	public void updateRCNR(EmailVO vo, HttpSession session, HttpServletRequest request) {
		vo.setReadCheck((String)session.getAttribute("ReadCheck"));
		service.updateRCNR(vo);
	}
	

	// 메일발송처리
	@RequestMapping("mailSend")
	public void mailSend(EmailVO vo, HttpServletResponse response
			, @ModelAttribute("searchVO") MessageVO searchVO,
			SessionStatus status, HttpSession hsession, Model model) throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		EmpVO empvo =SessionInfo.getInfo(hsession, "emp");
		vo.setFromEmail(empvo.getEmail());
		vo.setEmpNo(empvo.getEmpNo());
		
		status.setComplete();
		emailService.send(vo, empvo);
		model.addAttribute("emp", empvo.getEmail());
		
		PrintWriter out = response.getWriter();
		out.println("<script>alert('메일을 전송하였습니다.'); location.href='success_email';</script>");

	}
	
	//받은 메일 보관함 
	@RequestMapping("email_List")   
	public String getMail(EmpVO empvo, EmailVO vo ,HttpSession hsession,
			 SessionStatus status, Model model) throws Exception  { 
		
		String host = "pop.gmail.com";// change accordingly
	  	String  mailStoreType ="pop3"; 
	  	final String username =empvo.getEmail(); // change accordingly
		final String password = empvo.getGmailAppKey(); // change accordingly
		
		empvo=SessionInfo.getInfo(hsession, "emp");
		vo.setEmpNo(empvo.getEmpNo());
		 fetch.check(host,mailStoreType, username, password);
		
		 List<EmailVO> list = service.getEmailList(vo);
		model.addAttribute("emailList", list);
		
		return "email/email_List";	
	}

	//메일 보기 상세 화면 
	  @RequestMapping("/reading_mail/{inboxid}") 
	  public String reading_mail(Model model, HttpSession hsession,
														  EmailVO vo ,
														 @PathVariable Integer inboxid
														) throws Exception {
		  EmpVO empvo =SessionInfo.getInfo(hsession, "emp");
		  vo.setInboxid(inboxid);
		  
	  	model.addAttribute("rEmail", service.getINBOXOne(vo));
	  return "email/reading_mail" ;
	  
	  }

}
