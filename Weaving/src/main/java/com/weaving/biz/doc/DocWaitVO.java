package com.weaving.biz.doc;

/***
 * 대기중인 문서 정보
 */
public class DocWaitVO extends DocBaseVO {

	private int waitEmpNo;
	private String waitEmpName;
	
	public int getWaitEmpNo() {
		return waitEmpNo;
	}
	public void setWaitEmpNo(int waitEmpNo) {
		this.waitEmpNo = waitEmpNo;
	}
	public String getWaitEmpName() {
		return waitEmpName;
	}
	public void setWaitEmpName(String waitEmpName) {
		this.waitEmpName = waitEmpName;
	}
	
	@Override
	public String toString() {
		return "DocWaitVO [waitEmpNo=" + waitEmpNo + ", waitEmpName=" + waitEmpName + ", toString()=" + super.toString()
				+ "]";
	}
	
	
}
