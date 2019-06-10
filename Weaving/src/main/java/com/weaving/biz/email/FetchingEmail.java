package com.weaving.biz.email;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.NoSuchProviderException;
import javax.mail.Part;
import javax.mail.Session;
import javax.mail.Store;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttributes;
@Service
@SessionAttributes(types = EmailVO.class)
public class FetchingEmail {

	@Autowired
	private EmailService emailService;
	
	  static String contentBody = "";

	public void fetchEmailFromServer(String pop3Host, String storeType, String user, String password) {
		
			Message message = null;
		try {
			// create properties field
			Properties properties = new Properties();
			properties.put("mail.store.protocol", "pop3");
			properties.put("mail.pop3.host", pop3Host);
			properties.put("mail.pop3.port", "995");
			properties.put("mail.pop3.starttls.enable", "true");
			Session emailSession = Session.getDefaultInstance(properties);
			// emailSession.setDebug(true);

			// create the POP3 store object and connect with the pop server
			Store store = emailSession.getStore("pop3s");

			store.connect(pop3Host, user, password);

			// create the folder object and open it
			Folder emailFolder = store.getFolder("INBOX");
			emailFolder.open(Folder.READ_ONLY);

			BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

			// retrieve the messages from the folder in an array and print it
			Message[] messages = emailFolder.getMessages();
			System.out.println("messages.length---" + messages.length);

			for (int i = 0; i < messages.length; i++) {
				EmailVO vo = new EmailVO();
				message = messages[i];
				contentBody = " ";
				System.out.println("---------------------------------");
				writePart(message,vo);
				vo.setInboxContents(contentBody);
				
				emailService.insertInbox(vo);	
			}
			 
		
			// close the store and folder objects
			emailFolder.close(false);
			store.close();

		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public  List<EmailVO> check(String host, String storeType, String user, String password) {
		List<EmailVO> list = new ArrayList<EmailVO>();
		
		try {
			// create properties field
			Properties properties = new Properties();
			properties.put("mail.pop3.host", host);
			properties.put("mail.pop3.port", "995");
			properties.put("mail.pop3.starttls.enable", "true");
			Session emailSession = Session.getDefaultInstance(properties);

			// create the POP3 store object and connect with the pop server
			Store store = emailSession.getStore("pop3s");

			store.connect(host, user, password);

			// create the folder object and open it
			Folder emailFolder = store.getFolder("INBOX");
			emailFolder.open(Folder.READ_ONLY);

			// retrieve the messages from the folder in an array and print it
			Message[] messages = emailFolder.getMessages();
			System.out.println("messages.length---" + messages.length);

			// 리스트 담아서 리턴
			for (int i = 0, n = messages.length; i < n; i++) {
				Message message = messages[i];

				EmailVO vo = new EmailVO();
				contentBody = " ";
				writePart(message,vo);
				vo.setInboxContents(contentBody);
				emailService.insertInbox(vo);	
				
				list.add(vo);
			}
			// close the store and folder objects
			emailFolder.close(false);
			store.close();

		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	/*
	 *개인메일 본문 읽기 
	 */
	public static void writePart(Part p, EmailVO vo) throws Exception {
		
		if (p instanceof Message)
			// Call methos writeEnvelope
			writeEnvelope((Message) p,vo);

		vo.setContenttype(p.getContentType());
	//	System.out.println("----------------------------");
	//	System.out.println("CONTENT-TYPE: " + p.getContentType());
		
		// 그냥 텍스트 
		if (p.isMimeType("text/plain")) {
		//	System.out.println("This is plain text");
		//	System.out.println("---------------------------");
		//	System.out.println((String) p.getContent());
			contentBody += (String) p.getContent();
			//텍스트 HTML 
		}else if (p.isMimeType("text/HTML")) {
			System.out.println((String) p.getContent());
			contentBody += (String) p.getContent();
		}
		
		// 멀티파트  타입 체크( attachment)
		else if (p.isMimeType("multipart/*")) {
			Multipart mp = (Multipart) p.getContent();
			int count = mp.getCount();
			for (int i = 0; i < count; i++)
				writePart(mp.getBodyPart(i),vo);
		}
		// 메세지 타입 
		else if (p.isMimeType("message/rfc822")) {
		//	System.out.println("This is a Nested Message");
		//	System.out.println("---------------------------");
			writePart((Part) p.getContent(),vo);
		}
		// 이미지 
		else if (p.isMimeType("image/jpeg")) {
			//System.out.println("--------> image/jpeg");
			Object o = p.getContent();
			InputStream x = (InputStream) o;
			//바이트 배열  
		//	System.out.println("x.length = " + x.available());
			int i = 0;
			byte[] bArray = new byte[x.available()];
			
			while ((i = (int) ((InputStream) x).available()) > 0) {
				int result = (int) (((InputStream) x).read(bArray));
				if (result == -1)
					break;
				}	
			String fileName = new Date().getTime() + ".jpg";
			//바이트 단위로 입력을 받음 
			FileOutputStream f2 = new FileOutputStream(fileName);
			f2.write(bArray);
			
			contentBody += "<img src=\"../images/mail/"+fileName+"\">";
			
		} else if (p.getContentType().contains("image/")) {
			System.out.println("content type" + p.getContentType());
			String fileName =new Date().getTime() + ".jpg";
			File f = new File(fileName);
			DataOutputStream output = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(f)));
			com.sun.mail.util.BASE64DecoderStream test = (com.sun.mail.util.BASE64DecoderStream) p.getContent();
			byte[] buffer = new byte[1024];
			int bytesRead;
			// 서버에 파일을 저장 
			while ((bytesRead = test.read(buffer)) != -1) {
				output.write(buffer, 0, bytesRead);
			}
			contentBody += "<img src=\""+fileName+"\">";
		}
	}
	
	/*
	 * 개인 메일 투 프롬 데이터 수브젴 읽기 
	 */
	public static void writeEnvelope(Message m, EmailVO vo) throws Exception {
		System.out.println("This is the message envelope");
		System.out.println("---------------------------");
		Address[] a;
		
		// FROM
		if ((a = m.getFrom()) != null) {
			for (int j = 0; j < a.length; j++) {
				String str =  a[j].toString();
				if (str.contains("<")) {
					int idx = str.indexOf("<");
					String ad = str.substring(idx + 1);
					int idx2 = ad.indexOf(">");
					String add = ad.substring(0, idx2);
					System.out.println("보낸 주소: " + add);
	
					vo.setFromEmail(add);
				} else {
					vo.setFromEmail(str);
				}
			}
		}
		

		// TO
		if ((a = m.getRecipients(Message.RecipientType.TO)) != null) {
			for (int j = 0; j < a.length; j++) {
				String str = a[j].toString();
				if (str.contains("<")) {
					int idx = str.indexOf("<");
					String ad = str.substring(idx + 1);
					int idx2 = ad.indexOf(">");
					String add = ad.substring(0, idx2);
	
					System.out.println("받는 주소: " + add);
					vo.setToEmail(add);
				} else {
					System.out.println("받는 주소: " + str);
					vo.setToEmail(str);				
				}
		}
	}

		// SUBJECT
		if (m.getSubject() != null) {
			vo.setSubject(m.getSubject());
		}
	}
	
	

	
	
	
	

	/*
	 * emailContents to_date(#{checkTime},'YYYY-MM-DD HH24:MI:SS'), readCheck empNo
	 * mailNo
	 */
	
	

}