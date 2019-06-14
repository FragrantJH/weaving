package com.weaving.biz.email.web;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.weaving.biz.common.SessionInfo;
import com.weaving.biz.email.EmailService;
import com.weaving.biz.email.EmailVO;
import com.weaving.biz.email.FetchingEmail;
import com.weaving.biz.email.MessageVO;
import com.weaving.biz.email.ReplyToEmail;
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

	@Autowired
	ReplyToEmail replyto;
	// 메일보내기폼
	@RequestMapping("mailForm")
	public String mailForm() {
		return "email/mailForm";
	}
	
	//답장폼 
	@RequestMapping("/replyForm/{fromInbox:.+}")
	public String replyForm(@PathVariable String fromInbox,Model model) {
		model.addAttribute("to",fromInbox);
		return "email/reply_mail";
	}

	// 메일발송완료폼
	@RequestMapping("success_email")
	public String success_email() {
		return "email/success_email";
	}

	// 삭제
	@RequestMapping(value = "/meilDelete", method = RequestMethod.GET)
	public String meilDelete(EmailVO vo, HttpSession session, HttpServletRequest request) {
		vo.setInboxid(Integer.parseInt(request.getParameter("inboxid")));
		service.deleteInbox(vo);
		return "redirect:/email_List";
	}
	
	// 삭제 보낸 이메일 
		@RequestMapping(value = "/meilDeleteRe", method = RequestMethod.GET)
		public String meilDeleteRe(EmailVO vo, HttpSession session, HttpServletRequest request) {
			vo.setEmailId(Integer.parseInt(request.getParameter("emailId")));
			service.deleteEmail(vo);
			return "redirect:/email_ListRe";
		}

	// 메일발송처리
	@RequestMapping("mailSend")
	public void mailSend(EmailVO vo, HttpServletResponse response, @ModelAttribute("searchVO") MessageVO searchVO,
			SessionStatus status, HttpSession hsession, Model model) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		EmpVO empvo = SessionInfo.getInfo(hsession, "emp");
		vo.setFromEmail(empvo.getEmail());
		vo.setEmpNo(empvo.getEmpNo());

		status.setComplete();
		emailService.send(vo, empvo);
		model.addAttribute("emp", empvo.getEmail());

		PrintWriter out = response.getWriter();
		out.println("<script>alert('메일을 전송하였습니다.'); location.href='email_ListRe';</script>");

	}
	
	// 답장발송처리
		@RequestMapping("/reply_mail")
		public void replymailSend(EmailVO vo, HttpServletResponse response,
				SessionStatus status, HttpSession hsession, Model model) throws Exception {

			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			EmpVO empvo = SessionInfo.getInfo(hsession, "emp");
			vo.setEmpNo(empvo.getEmpNo());
			
			status.setComplete();
			replyto.send(vo, empvo,  empvo.getEmpNo());
			model.addAttribute("emp", empvo.getEmail());

			PrintWriter out = response.getWriter();
			out.println("<script>alert('메일을 전송하였습니다.'); location.href='email_ListRe';</script>");
		}

	// 받은 메일 보관함
	@RequestMapping("email_List")
	public String getMail(EmailVO vo, HttpSession hsession, SessionStatus status, Model model)
			throws Exception {
		EmpVO empvo = SessionInfo.getInfo(hsession, "emp");
		vo.setEmpNo(empvo.getEmpNo());
		
		String host = "pop.gmail.com";// change accordingly
		String mailStoreType = "pop3";
		String username = empvo.getEmail(); // change accordingly
		String password = empvo.getGmailAppKey(); // change accordingly
		
		fetch.check(host, mailStoreType, username, password, empvo.getEmpNo());
		
		List<EmailVO> list = service.getEmailList(vo);
		model.addAttribute("emailList", list);

		return "email/email_List";
	}
	
	// 보낸 메일 보관함
		@RequestMapping("email_ListRe")
		public String getMailRe(EmailVO vo, HttpSession hsession, SessionStatus status, Model model)
				throws Exception {
			EmpVO empvo = SessionInfo.getInfo(hsession, "emp");
			vo.setEmpNo(empvo.getEmpNo());
			
			List<EmailVO> list = service.getEmailListRe(vo);
			model.addAttribute("emailListRe", list);

			return "email/email_ListRe";
		}
	// 메일 보기 상세 화면
	@RequestMapping("/reading_mail/{inboxid}")
	public String reading_mail(EmpVO empvo,Model model, HttpSession hsession, EmailVO vo, @PathVariable Integer inboxid)
			throws Exception {

		empvo = SessionInfo.getInfo(hsession, "emp");
		
		// mail id 로 메일 단건 조회
		vo.setInboxid(inboxid);
		
		model.addAttribute("rEmail", service.getINBOXOne(vo));
		
		return "email/reading_mail";

	}
	// 보낸 메일 보기 상세 화면
		@RequestMapping("/reading_mailRe/{emailId}")
		public String reading_mailRe(EmpVO empvo,Model model, HttpSession hsession, EmailVO vo, @PathVariable Integer emailId)
				throws Exception {

			empvo = SessionInfo.getInfo(hsession, "emp");
			
			// mail id 로 메일 단건 조회
			vo.setEmailId(emailId);
			
			model.addAttribute("rEmailRe", service.getEmailOne(vo));
			
			return "email/reading_mailRe";

		}

}
