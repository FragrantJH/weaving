package com.weaving.biz.doc;

import java.util.Arrays;

public class DocVO {
	private int docId;
	private int empNo;
	private int approvalOrder;
	private String empName;
	private String status;
	private String docNo;
	private String docTitle;
	private String docContents;
	private String regDate;
	private String doneDate;
	private String approvalDate;
	private String secureLevel;
	//검색조건
	private String searchCondition;
	private String searchKeyword;
	private String[] seqs;

	
	public String getApprovalDate() {
		return approvalDate;
	}
	public void setApprovalDate(String approvalDate) {
		this.approvalDate = approvalDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getApprovalOrder() {
		return approvalOrder;
	}
	public void setApprovalOrder(int approvalOrder) {
		this.approvalOrder = approvalOrder;
	}
	public int getDocId() {
		return docId;
	}
	public void setDocId(int docId) {
		this.docId = docId;
	}
	public int getEmpNo() {
		return empNo;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
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
	public String getDocContents() {
		return docContents;
	}
	public void setDocContents(String docContents) {
		this.docContents = docContents;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getDoneDate() {
		return doneDate;
	}
	public void setDoneDate(String doneDate) {
		this.doneDate = doneDate;
	}
	public String getSecureLevel() {
		return secureLevel;
	}
	public void setSecureLevel(String secureLevel) {
		this.secureLevel = secureLevel;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String[] getSeqs() {
		return seqs;
	}
	public void setSeqs(String[] seqs) {
		this.seqs = seqs;
	}
	@Override
	public String toString() {
		return "DocVO [docId=" + docId + ", empNo=" + empNo + ", approvalOrder=" + approvalOrder + ", empName="
				+ empName + ", status=" + status + ", docNo=" + docNo + ", docTitle=" + docTitle + ", docContents="
				+ docContents + ", regDate=" + regDate + ", doneDate=" + doneDate + ", approvalDate=" + approvalDate
				+ ", secureLevel=" + secureLevel + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + ", seqs=" + Arrays.toString(seqs) + "]";
	}	
	
}
