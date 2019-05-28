package com.weaving.biz.doc;

import java.util.Date;

public class DocBaseVO {
	
	private int docId;
	private int writerEmpNo;
	private String writerEmpName;
	private String docNo;
	private String docTitle;
	private Date regDate;
	private Date doneDate;
	private char secureLevel;

	public int getDocId() {
		return docId;
	}

	public void setDocId(int docId) {
		this.docId = docId;
	}

	public int getWriterEmpNo() {
		return writerEmpNo;
	}

	public void setWriterEmpNo(int writerEmpNo) {
		this.writerEmpNo = writerEmpNo;
	}

	public String getWriterEmpName() {
		return writerEmpName;
	}

	public void setWriterEmpName(String writerEmpName) {
		this.writerEmpName = writerEmpName;
	}

	public String getDocNo() {
		return docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

	public String getDocTitle() {
		return docTitle;
	}

	public void setDocTitle(String docTitle) {
		this.docTitle = docTitle;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getDoneDate() {
		return doneDate;
	}

	public void setDoneDate(Date doneDate) {
		this.doneDate = doneDate;
	}

	public char getSecureLevel() {
		return secureLevel;
	}

	public void setSecureLevel(char secureLevel) {
		this.secureLevel = secureLevel;
	}
}
