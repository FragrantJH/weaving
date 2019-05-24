package com.weaving.biz.doc;

public class DocHistoryVO {
	private int historyId;
	private int docId;
	private int empNo;
	private String preStatus;
	private String curStatus;
	private String changeDate;
	
	public int getHistoryId() {
		return historyId;
	}
	public void setHistoryId(int historyId) {
		this.historyId = historyId;
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
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getPreStatus() {
		return preStatus;
	}
	public void setPreStatus(String preStatus) {
		this.preStatus = preStatus;
	}
	public String getCurStatus() {
		return curStatus;
	}
	public void setCurStatus(String curStatus) {
		this.curStatus = curStatus;
	}
	public String getChangeDate() {
		return changeDate;
	}
	public void setChangeDate(String changeDate) {
		this.changeDate = changeDate;
	}
	
	@Override
	public String toString() {
		return "DocHistoryVO [historyId=" + historyId + ", docId=" + docId + ", empNo=" + empNo + ", preStatus="
				+ preStatus + ", curStatus=" + curStatus + ", changeDate=" + changeDate + "]";
	}
	
}
