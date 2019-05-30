package com.weaving.biz.doc;

/***
 * 결재 반려문서 VO
 *
 */
public class DocReturnVO extends DocBaseVO {

	private int returnEmpNo;
	private String returnEmpName;

	public int getReturnEmpNo() {
		return returnEmpNo;
	}

	public void setReturnEmpNo(int returnEmpNo) {
		this.returnEmpNo = returnEmpNo;
	}

	public String getReturnEmpName() {
		return returnEmpName;
	}

	public void setReturnEmpName(String returnEmpName) {
		this.returnEmpName = returnEmpName;
	}

	@Override
	public String toString() {
		return "DocReturnVO [returnEmpNo=" + returnEmpNo + ", returnEmpName=" + returnEmpName + ", toString()="
				+ super.toString() + "]";
	}
}
