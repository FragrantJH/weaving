package com.weaving.biz.email;

import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
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

public class CheckingMails {

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
			//if(messages.length != 0) {
				 for (int i = 0, n = messages.length; i < n; i++) {
				Message message = messages[i];

				EmailVO vo = new EmailVO();

			//	vo.setSubject(message.getSubject());
			//	vo.setFrom(message.getFrom()[0].toString());
			//	vo.setContent(((Multipart)message.getContent()).getBodyPart(0).toString() );
				writePart(message, vo);
				
				list.add(vo);
				
			}
			/*
			 * }else { for(int i=1; i<5; i++) { Message message = messages[i];
			 * 
			 * EmailVO vo = new EmailVO(); writePart(message, vo);
			 * 
			 * list.add(vo); } }
			 */

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
	
	   public static void writePart(Part p, EmailVO vo) throws Exception {
		      if (p instanceof Message)
		         //Call methos writeEnvelope
		         writeEnvelope((Message) p,vo);

		      System.out.println("----------------------------");
		      System.out.println("CONTENT-TYPE: " + p.getContentType());

		      //check if the content is plain text
		      if (p.isMimeType("text/plain")) {
		         System.out.println("This is plain text");
		         System.out.println("---------------------------");
		       vo.setContent((String) p.getContent());
		      } 
		      //check if the content has attachment
		      else if (p.isMimeType("multipart/*")) {
		         System.out.println("This is a Multipart");
		         System.out.println("---------------------------");
		         Multipart mp = (Multipart) p.getContent();
		         int count = mp.getCount();
		         for (int i = 0; i < count; i++)
		            writePart(mp.getBodyPart(i),vo);
		      } 
		      //check if the content is a nested message
		      else if (p.isMimeType("message/rfc822")) {
		         System.out.println("This is a Nested Message");
		         System.out.println("---------------------------");
		         writePart((Part) p.getContent(),vo);
		      } 
		      //check if the content is an inline image
		      else if (p.isMimeType("image/jpeg")) {
		         System.out.println("--------> image/jpeg");
		         Object o = p.getContent();

		         InputStream x = (InputStream) o;
		         // Construct the required byte array
		         System.out.println("x.length = " + x.available());
		         int i = 0;
		         byte[] bArray = new byte[x.available()];
		         
		         while ((i = (int) ((InputStream) x).available()) > 0) {
		            int result = (int) (((InputStream) x).read(bArray));
		            if (result == -1)
		       

		            break;
		         }
		         FileOutputStream f2 = new FileOutputStream("/tmp/image.jpg");
		         f2.write(bArray);
		      } 
		      else if (p.getContentType().contains("image/")) {
		         System.out.println("content type" + p.getContentType());
		         File f = new File("image" + new Date().getTime() + ".jpg");
		         DataOutputStream output = new DataOutputStream(
		            new BufferedOutputStream(new FileOutputStream(f)));
		            com.sun.mail.util.BASE64DecoderStream test = 
		                 (com.sun.mail.util.BASE64DecoderStream) p
		                  .getContent();
		         byte[] buffer = new byte[1024];
		         int bytesRead;
		         while ((bytesRead = test.read(buffer)) != -1) {
		            output.write(buffer, 0, bytesRead);
		         }
		      } 
		      else {
		         Object o = p.getContent();
		         if (o instanceof String) {
		            System.out.println("This is a string");
		            System.out.println("---------------------------");
		            System.out.println((String) o);
		         } 
		         else if (o instanceof InputStream) {
		            System.out.println("This is just an input stream");
		            System.out.println("---------------------------");
		            InputStream is = (InputStream) o;
		            is = (InputStream) o;
		            int c;
		            while ((c = is.read()) != -1)
		               System.out.write(c);
		         } 
		         else {
		            System.out.println("This is an unknown type");
		            System.out.println("---------------------------");
		            System.out.println(o.toString());
		         }
		      }

		   }
	   public static void writeEnvelope(Message m, EmailVO vo) throws Exception {
		      System.out.println("This is the message envelope");
		      System.out.println("---------------------------");
		      Address[] a;

		      // FROM
		      if ((a = m.getFrom()) != null) {
		         for (int j = 0; j < a.length; j++)
		         vo.setFrom( a[j].toString());
		      }

		      // TO
		      if ((a = m.getRecipients(Message.RecipientType.TO)) != null) {
		         for (int j = 0; j < a.length; j++)
		         vo.setTo(a[j].toString());
		      }

		      // SUBJECT
		      if (m.getSubject() != null) {
		    	  vo.setSubject(m.getSubject());
		      }
		  
 

		   }


}
