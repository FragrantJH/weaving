package com.weaving.biz.doc;

public class DocApprovalVO extends DocBaseVO{	
	private int empNo;
	private String status;
	private String approvalDate;
	private String approvalComments;
	
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
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
	@Override
	public String toString() {
		return "DocApprovalVO [empNo=" + empNo + ", status=" + status + ", approvalDate=" + approvalDate
				+ ", approvalComments=" + approvalComments + "]";
	}
	
}
