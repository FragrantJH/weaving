package com.weaving.biz.email;

import java.util.Arrays;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class EmailVO {
	
	int emailId;
	String fromEmail; 	//보낸사람 
	String toEmail;			//받는 사람 
	String subject; 			//제목 
	String emailContents;// 본문 내용 
	String inboxContents;
	Date checkTime;			//시간 체크 
	int readCheck;				// 0안읽음 1 읽음 
	
	String contenttype;   //타입 설정 
	
	String filename;			
	String gmailAppKey;
	
	String attachment; 
	int empNo;
	int mailNoList[];
	MultipartFile uploadFile;
	    
	 String[] toarr;

	 
	 	
	public String getInboxContents() {
		return inboxContents;
	}

	public void setInboxContents(String inboxContents) {
		this.inboxContents = inboxContents;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public int getEmailId() {
		return emailId;
	}

	public void setEmailId(int emailId) {
		this.emailId = emailId;
	}

	public String getFromEmail() {
		return fromEmail;
	}

	public void setFromEmail(String fromEmail) {
		this.fromEmail = fromEmail;
	}

	public String getToEmail() {
		return toEmail;
	}

	public void setToEmail(String toEmail) {
		this.toEmail = toEmail;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getEmailContents() {
		return emailContents;
	}

	public void setEmailContents(String emailContents) {
		this.emailContents = emailContents;
	}

	public Date getCheckTime() {
		return checkTime;
	}

	public void setCheckTime(Date d) {
		this.checkTime = (Date) d;
	}

	public int getReadCheck() {
		return readCheck;
	}

	public void setReadCheck(int readCheck) {
		this.readCheck = readCheck;
	}

	public String getContenttype() {
		return contenttype;
	}

	public void setContenttype(String contenttype) {
		this.contenttype = contenttype;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getGmailAppKey() {
		return gmailAppKey;
	}

	public void setGmailAppKey(String gmailAppKey) {
		this.gmailAppKey = gmailAppKey;
	}

	public String getAttachment() {
		return attachment;
	}

	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}


	public int[] getMailNoList() {
		return mailNoList;
	}

	public void setMailNoList(int[] mailNoList) {
		this.mailNoList = mailNoList;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String[] getToarr() {
		return toarr;
	}

	public void setToarr(String[] toarr) {
		this.toarr = toarr;
	}

	@Override
	public String toString() {
		return "EmailVO [emailId=" + emailId + ", fromEmail=" + fromEmail + ", toEmail=" + toEmail + ", subject="
				+ subject + ", emailContents=" + emailContents + ", inboxContents=" + inboxContents + ", checkTime="
				+ checkTime + ", readCheck=" + readCheck + ", contenttype=" + contenttype + ", filename=" + filename
				+ ", gmailAppKey=" + gmailAppKey + ", attachment=" + attachment + ", empNo=" + empNo + ", mailNoList="
				+ Arrays.toString(mailNoList) + ", uploadFile=" + uploadFile + ", toarr=" + Arrays.toString(toarr)
				+ "]";
	}

	

	
	
	
	 
}
