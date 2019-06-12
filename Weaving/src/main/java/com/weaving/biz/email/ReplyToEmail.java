package com.weaving.biz.email;

import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weaving.biz.board.BoardVO;
import com.weaving.biz.doc.DocWaitVO;
import com.weaving.biz.emp.EmpVO;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Date;
import java.util.Properties;

import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
@Service
public class ReplyToEmail {
	
	@Autowired
	static
	EmailService sv;
	
	 public static void replyto(EmailVO vo, EmpVO evo){
	      Date date = null;

	      Properties properties = new Properties();
	      properties.put("mail.store.protocol", "pop3");
	      properties.put("mail.pop3s.host", "pop.gmail.com");
	      properties.put("mail.pop3s.port", "995");
	      properties.put("mail.pop3.starttls.enable", "true");
	      properties.put("mail.smtp.auth", "true");
	      properties.put("mail.smtp.starttls.enable", "true");
	      properties.put("mail.smtp.host", "relay.jangosmtp.net");
	      properties.put("mail.smtp.port", "25");
	      Session session = Session.getDefaultInstance(properties);
	      //속성에서 POP 및 SMPT 서버 세부 정보가있는 Session 객체를 가져옵니다.
	      // session.setDebug(true);
	      try 
	      {
	    	//메일을 보내려면 POP 세부 정보가 필요하고 메시지를 보내려면 SMPT 세부 정보가 필요합니다.
	    	// Store 개체를 가져와서 현재 호스트에 연결
	         //POP3 저장소 개체를 만들고 저장소에 연결합니다.
	    	  Store store = session.getStore("pop3s");
	         store.connect("pop.gmail.com", "evo.getEmail()",
	            "evo.getgmailAppKey()");//세션 안에있는 사람의 이메일 주소로 메일연결  접속
	         //폴더 개체를 만들고 사서함에 해당 폴더를 엽니 다.
	         Folder folder = store.getFolder("inbox");
	         if (!folder.exists()) {
	            System.out.println("inbox not found");
	               System.exit(0);
	         }
	         folder.open(Folder.READ_ONLY);

	         BufferedReader reader = new BufferedReader(new InputStreamReader(
	            System.in));
	         	//메시지를 검색하십시오.
	         Message[] messages = folder.getMessages();
	         if (messages.length != 0) {

	            for (int i = 0, n = messages.length; i < n; i++) {
	               Message message = messages[i];
	               date = message.getSentDate();
	            
	               //  메시지의 모든 정보 (받는 사람, 보낸 사람, 제목, 내용)를 가져옵니다.
	               String from = InternetAddress.toString(message.getFrom());
	               if (from != null) {
	                  System.out.println("From: " + from);
	               }
	               String replyTo = InternetAddress.toString(message.getReplyTo());
	               if (replyTo != null) {
	                  System.out.println("Reply-to: " + replyTo);
	               }
	               String to = InternetAddress.toString(message.getRecipients(Message.RecipientType.TO));
	               if (to != null) {
	                  System.out.println("To: " + to);
	               }
	               String subject = message.getSubject();
	               if (subject != null) {
	                  System.out.println("Subject: " + subject);
	               }
	               Date sent = message.getSentDate();
	               if (sent != null) {
	                  System.out.println("Sent: " + sent);
	               }
	               
	               //Message.reply () 메소드를 사용하여 응답 메시지를 작성하십시오.
	                  Message replyMessage = new MimeMessage(session);
	                  replyMessage = (MimeMessage) message.reply(false);
	                  replyMessage.setFrom(new InternetAddress(to));
	                  replyMessage.setText("Thanks");
	                  replyMessage.setReplyTo(message.getReplyTo());
	                  //From, Text 및 Reply-to를 메시지에 설정하고 
	                  
	               // SMTP 서버를 인증하여 메시지 전송
	                  Transport t = session.getTransport("smtp");
	                  //Transport 개체의 인스턴스를 통해 보냅니다
	                  try {
		             t.connect("evo.getEmail()", "evo.getgmailAppKey()");
		             // 전송 인스턴스를 생성하고 sendMessage를 호출하십시오.
		             t.sendMessage(replyMessage,
	                        replyMessage.getAllRecipients());
	                  } finally {
	                     t.close();
	                  }
	                  System.out.println("message replied successfully ....");

	                  // 전송, 폴더 및 저장소 개체를 각각 닫습니다.
	                  folder.close(false);
	                  store.close();

	               } 
	            }//end of for loop
	      } catch (Exception e) {
	         e.printStackTrace();
	      }

	   }

	}
	


