package com.weaving.biz.email;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Date;
import java.util.Properties;

import javax.annotation.Resource;
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
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes(types = EmailVO.class)
public class FetchingEmail {

	@Autowired
	private EmailService emailService;
	
	  static String contentBody = "";

	public void fetchEmailFromServer(String pop3Host, String storeType, String user, String password) {
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
				contentBody = "";
				System.out.println("---------------------------------");
				writePart(messages[i]);
				// TODO 필요한 정보 vo에 담기
				vo.setEmailContents(contentBody);
				emailService.insertEmail(vo);
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

	/*
	 * This method checks for content-type based on which, it processes and fetches
	 * the content of the message
	 */
	public static void writePart(Part p) throws Exception {
		if (p instanceof Message)
			
		
			// Call methos writeEnvelope
			writeEnvelope((Message) p);

	//	System.out.println("----------------------------");
	//	System.out.println("CONTENT-TYPE: " + p.getContentType());
		
		// check if the content is plain text
		if (p.isMimeType("text/plain")) {
		//	System.out.println("This is plain text");
		//	System.out.println("---------------------------");
		//	System.out.println((String) p.getContent());
		}
		// check if the content has attachment
		else if (p.isMimeType("multipart/*")) {
		//	System.out.println("This is a Multipart");
		//	System.out.println("---------------------------");
			Multipart mp = (Multipart) p.getContent();
			int count = mp.getCount();
			for (int i = 0; i < count; i++)
				writePart(mp.getBodyPart(i));
		}
		// check if the content is a nested message
		else if (p.isMimeType("message/rfc822")) {
		//	System.out.println("This is a Nested Message");
		//	System.out.println("---------------------------");
			writePart((Part) p.getContent());
		}
		// check if the content is an inline image
		else if (p.isMimeType("image/jpeg")) {
			//System.out.println("--------> image/jpeg");
			Object o = p.getContent();

			InputStream x = (InputStream) o;
			// Construct the required byte array
		//	System.out.println("x.length = " + x.available());
			int i = 0;
			byte[] bArray = new byte[x.available()];

			while ((i = (int) ((InputStream) x).available()) > 0) {
				int result = (int) (((InputStream) x).read(bArray));
				if (result == -1)

					break;
			}	
			String fileName = new Date().getTime() + ".jpg";
			
			FileOutputStream f2 = new FileOutputStream(fileName);
			f2.write(bArray);
			
			contentBody += "<img src=\"../images/mail/"+fileName+"\">";
			
		} else if (p.getContentType().contains("image/")) {
			System.out.println("content type" + p.getContentType());
			File f = new File(contentBody);
			DataOutputStream output = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(f)));
			com.sun.mail.util.BASE64DecoderStream test = (com.sun.mail.util.BASE64DecoderStream) p.getContent();
			byte[] buffer = new byte[1024];
			int bytesRead;
			// 서버에 파일을 저장 
			while ((bytesRead = test.read(buffer)) != -1) {
				output.write(buffer, 0, bytesRead);
			}
			
			contentBody += "<img src=\""+contentBody+"\">";
			
			
		} /*
			 * else { Object o = p.getContent(); if (o instanceof String) {
			 * System.out.println("This is a string");
			 * System.out.println("---------------------------");
			 * System.out.println((String) o); } else if (o instanceof InputStream) {
			 * System.out.println("This is just an input stream");
			 * System.out.println("---------------------------"); InputStream is =
			 * (InputStream) o; is = (InputStream) o; int c; while ((c = is.read()) != -1)
			 * System.out.write(c); } else { System.out.println("This is an unknown type");
			 * System.out.println("---------------------------");
			 * System.out.println(o.toString()); } }
			 */

	}

	/*
	 * This method would print FROM,TO and SUBJECT of the message
	 */
	public static void writeEnvelope(Message m) throws Exception {
		System.out.println("This is the message envelope");
		System.out.println("---------------------------");
		Address[] a;
		EmailVO vo = new EmailVO();
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
			} else
				vo.setFromEmail(str);
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
			vo.setCheckTime((java.sql.Date) m.getSentDate());
		}
	}

}