package com.weaving.biz.email;

public class EmailVO {
	
	String from;
	String to;
	String subject;
	String content;
	String filename;
	String gmail_app_key;
	String email;
	
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getGmail_app_key() {
		return gmail_app_key;
	}
	public void setGmail_app_key(String gmail_app_key) {
		this.gmail_app_key = gmail_app_key;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "EmailVO [from=" + from + ", to=" + to + ", subject=" + subject + ", content=" + content + ", filename="
				+ filename + ", gmail_app_key=" + gmail_app_key + ", email=" + email + "]";
	}

	
	
}
