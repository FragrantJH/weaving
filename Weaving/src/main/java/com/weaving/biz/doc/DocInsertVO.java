package com.weaving.biz.doc;


public class DocInsertVO extends DocBaseVO{
	private int rowNum;
	
	private int docTypeSeq;
	private int empNo;
	private int approvalOrder;
	private String docType;
	private String docContents;
	private String status;
	private String approvalDate;
	private String approvalComments;

	public int getRowNum() {
		return rowNum;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public int getDocTypeSeq() {
		return docTypeSeq;
	}
	public int getApprovalOrder() {
		return approvalOrder;
	}
	public void setApprovalOrder(int approvalOrder) {
		this.approvalOrder = approvalOrder;
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
	public String getDocContents() {
		return docContents;
	}
	public void setDocContents(String docContents) {
		this.docContents = docContents;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getApprovalDate() {
		return approvalDate;
	}
	public void setApprovalDate(String approvalDate) {
		this.approvalDate = approvalDate;
	}
	public String getApprovalComments() {
		return approvalComments;
	}
	public void setApprovalComments(String approvalComments) {
		this.approvalComments = approvalComments;
	}	
}
