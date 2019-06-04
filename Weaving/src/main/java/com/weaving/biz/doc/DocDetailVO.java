package com.weaving.biz.doc;

public class DocDetailVO extends DocBaseVO{
	private int rowNum;
	private int empNo;
	private int approvalOrder;
	private String docContents;
	private String empName;
	private String deptName;
	private String approvalDate;
	private String approvalComments;
	private String status;
	private String position;
	
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	
	public int getApprovalOrder() {
		return approvalOrder;
	}
	public void setApprovalOrder(int approvalOrder) {
		this.approvalOrder = approvalOrder;
	}
	public String getDocContents() {
		return docContents;
	}
	public void setDocContents(String docContents) {
		this.docContents = docContents;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	@Override
	public String toString() {
		return "DocDetailVO [rowNum=" + rowNum + ", empNo=" + empNo + ", approvalOrder=" + approvalOrder
				+ ", docContents=" + docContents + ", empName=" + empName + ", deptName=" + deptName + ", approvalDate="
				+ approvalDate + ", approvalComments=" + approvalComments + ", status=" + status + ", position="
				+ position + ", getDocId()=" + getDocId() + ", getWriterEmpNo()=" + getWriterEmpNo()
				+ ", getWriterEmpName()=" + getWriterEmpName() + ", getDocNo()=" + getDocNo() + ", getDocTitle()="
				+ getDocTitle() + ", getRegDate()=" + getRegDate() + ", getDoneDate()=" + getDoneDate()
				+ ", getSecureLevel()=" + getSecureLevel() + ", getState()=" + getState() + "]";
	}

}
