package com.weaving.biz.chat;

public class MsgVO {

	private int empNo;
	private String empName;
	private int toEmpNo;
	private String msg;
	private String cmd;

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getCmd() {
		return cmd;
	}

	public void setCmd(String cmd) {
		this.cmd = cmd;
	}

	public int getToEmpNo() {
		return toEmpNo;
	}

	public void setToEmpNo(int toEmpNo) {
		this.toEmpNo = toEmpNo;
	}

}
