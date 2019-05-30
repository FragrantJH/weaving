package com.weaving.biz.emp;

import java.util.Arrays;

public class EmpVO {
	private String gmailAppKey;
	private int empNo;
	private String empName;
	private String password;
	private String position;
	private String joindate1;
	private String deptName;
	private String email;
	private String phone;
	private String address;
	private String deptId;
	private String deletedYn;
	private String deleteDate;
	private int seq;
	private String[] seqs;
	private int cnt;
	private boolean adminYn;
	
	public String getGmailAppKey() {
		return gmailAppKey;
	}
	public void setGmailAppKey(String gmailAppKey) {
		this.gmailAppKey = gmailAppKey;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}

	public String getJoindate1() {
		return joindate1;
	}
	public void setJoindate1(String joindate1) {
		this.joindate1 = joindate1;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getDeletedYn() {
		return deletedYn;
	}
	public void setDeletedYn(String deletedYn) {
		this.deletedYn = deletedYn;
	}

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String[] getSeqs() {
		return seqs;
	}
	public void setSeqs(String[] seqs) {
		this.seqs = seqs;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public boolean getAdminYn() {
		return adminYn;
	}
	public void setAdminYn(boolean adminYn) {
		this.adminYn = adminYn;
	}
	public String getDeleteDate() {
		return deleteDate;
	}
	public void setDeleteDate(String deleteDate) {
		this.deleteDate = deleteDate;
	}
	@Override
	public String toString() {
		return "EmpVO [gmailAppKey=" + gmailAppKey + ", empNo=" + empNo + ", empName=" + empName + ", password="
				+ password + ", position=" + position + ", joindate1=" + joindate1 + ", deptName=" + deptName
				+ ", email=" + email + ", phone=" + phone + ", address=" + address + ", deptId=" + deptId
				+ ", deletedYn=" + deletedYn + ", deleteDate=" + deleteDate + ", seq=" + seq + ", seqs="
				+ Arrays.toString(seqs) + ", cnt=" + cnt + ", adminYn=" + adminYn + "]";
	}
	
	
}
