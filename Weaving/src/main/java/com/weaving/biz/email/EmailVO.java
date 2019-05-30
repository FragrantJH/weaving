package com.weaving.biz.email;

import java.sql.Date;
import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class EmailVO {
	
	int emailId;
	String fromEmail;
	String toEmail;
	String subject;
	String emailContents;
	Date checkTime;
	String readCheck;
	
	String filename;
	String gmailAppKey;
	
	String attachment;
	String empNo;
	int mailNo;
	int mailNoList[];
	MultipartFile uploadFile;
	    
	 String[] toarr;
	
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
	public void setCheckTime(Date checkTime) {
		this.checkTime = checkTime;
	}
	public String getReadCheck() {
		return readCheck;
	}
	public void setReadCheck(String readCheck) {
		this.readCheck = readCheck;
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
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public int getMailNo() {
		return mailNo;
	}
	public void setMailNo(int mailNo) {
		this.mailNo = mailNo;
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
				+ subject + ", emailContents=" + emailContents + ", checkTime=" + checkTime + ", readCheck=" + readCheck
				+ ", filename=" + filename + ", gmailAppKey=" + gmailAppKey + ", attachment=" + attachment + ", empNo="
				+ empNo + ", mailNo=" + mailNo + ", mailNoList=" + Arrays.toString(mailNoList) + ", uploadFile="
				+ uploadFile + ", toarr=" + Arrays.toString(toarr) + "]";
	}
	
	
}
