package com.weaving.biz.dept;

public class DeptVO {
	private String deptId;
	private String deptName;
	private String upperDeptId;
	
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getUpperDeptId() {
		return upperDeptId;
	}
	public void setUpperDeptId(String upperDeptId) {
		this.upperDeptId = upperDeptId;
	}
	@Override
	public String toString() {
		return "DeptVO [deptId=" + deptId + ", deptName=" + deptName + ", upperDeptId=" + upperDeptId + "]";
	}

}
