package com.weaving.biz.doc;

import java.util.Arrays;

public class DocVO_ {
	private int rowNum;
	private int docId;
	private int empNo;
	private int approvalOrder;
	private int first;
	private int last;
	
	private String empName;
	private String status;
	private String docNo;
	private String docTitle;
	private String docContents;
	private String regDate;
	private String doneDate;
	private String approvalDate;
	private String secureLevel;
	private String approvalComments;
	
	//검색조건
	private String searchCondition;
	private String searchKeyword;
	private String[] seqs;

	private int docTypeSeq;
	private String docType;
	
	
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	public String getApprovalComments() {
		return approvalComments;
	}
	public void setApprovalComments(String approvalComments) {
		this.approvalComments = approvalComments;
	}
	public int getDocTypeSeq() {
		return docTypeSeq;
	}
	public void setDocTypeSeq(int docTypeSeq) {
		this.docTypeSeq = docTypeSeq;
	}
	public String getDocType() {
		return docType;
	}
	public void setDocType(String docType) {
		this.docType = docType;
	}
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
		return "DocVO [rowNum=" + rowNum + ", docId=" + docId + ", empNo=" + empNo + ", approvalOrder=" + approvalOrder
				+ ", first=" + first + ", last=" + last + ", empName=" + empName + ", status=" + status + ", docNo="
				+ docNo + ", docTitle=" + docTitle + ", docContents=" + docContents + ", regDate=" + regDate
				+ ", doneDate=" + doneDate + ", approvalDate=" + approvalDate + ", secureLevel=" + secureLevel
				+ ", approvalComments=" + approvalComments + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + ", seqs=" + Arrays.toString(seqs) + ", docTypeSeq=" + docTypeSeq + ", docType="
				+ docType + "]";
	}
}
