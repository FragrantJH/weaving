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
import javax.mail.Store;
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

@Service
public class ReplyToEmail {
	
	@Autowired
	EmailService sv;
	
	public void send(EmailVO vo, EmpVO empvo, int empNo) throws Exception {
		    
					String to =vo.getToEmail();  //내게 줫던사람 from값 
					String from =vo.getFromEmail(); //나 
					final String username =empvo.getEmail();
					final String password = empvo.getGmailAppKey();

		
		      // Assuming you are sending email through relay.jangosmtp.net
		      String host = "smtp.gmail.com";

		      Properties props = new Properties();
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.smtp.host", host);
				props.put("mail.smtp.port", "587");
		      
		      Session session = Session.getInstance(props,
		    	      new javax.mail.Authenticator() {
		    	         protected PasswordAuthentication getPasswordAuthentication() {
		    	            return new PasswordAuthentication(username, password);
		    	         }
		    	      });
		      PrintWriter writer = null;
		      try {
			   // Create a default MimeMessage object.
			   Message message = new MimeMessage(session);
			   message.setFrom(new InternetAddress(from));
			   message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			   message.setSubject(vo.getTitle());
			   message.setText(vo.getEmailContents());
			   // Send message
			   Transport.send(message);
				vo.setEmpNo(empNo);
			   sv.insertInboxEmail(vo);
			   System.out.println("Sent message successfully....");

		      } catch (MessagingException e) {
		         throw new RuntimeException(e);
		      }
		   }

	public void sendAttatch(EmailVO vo, EmpVO empVo) throws Exception {
		
		
		String to =vo.getFromInbox();  //내게 줫던사람 from값 
		String from =vo.getToInbox(); //나 
		final String username =empVo.getEmail();
		final String password = empVo.getGmailAppKey();
		
		// Assuming you are sending email through relay.jangosmtp.net
		String host = "smtp.gmail.com";
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");
		
		// Get the Session object.
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}			
		});
		
		try {
	         Message message = new MimeMessage(session);
	         message.setFrom(new InternetAddress(from));
	         message.setRecipients(Message.RecipientType.TO,
	            InternetAddress.parse(to));
	         
	         // Set Subject: header field
	         message.setSubject(vo.getTitle());
			 
	         // Create the message part
	         BodyPart messageBodyPart = new MimeBodyPart();
	         messageBodyPart.setText(vo.getInboxContents());
	         Multipart multipart = new MimeMultipart();
	         multipart.addBodyPart(messageBodyPart);
	         
	         // Part two is attachment
	         messageBodyPart = new MimeBodyPart();
	         String filename = vo.getFilename(); //  "/home/manisha/file.txt";
	         DataSource source = new FileDataSource(filename);
	         messageBodyPart.setDataHandler(new DataHandler(source));
	         messageBodyPart.setFileName(filename);
	         multipart.addBodyPart(messageBodyPart);
	         
	         message.setContent(multipart);	         
	         Transport.send(message);
	         
	        sv.insertEmail(vo);
	         
	         
	         System.out.println("Sent message successfully....");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	
	
		}
