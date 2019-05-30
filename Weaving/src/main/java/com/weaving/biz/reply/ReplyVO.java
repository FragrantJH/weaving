package com.weaving.biz.reply;

import java.sql.Date;

public class ReplyVO {
	private int replyId;
	private String repContents;
	private Date time;
	private int empNo;
	private String empName;
	private int boardId;
	private int first;
	private int last;
		
	public String getEmpName() {
		return empName;
	}
	
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public int getReplyId() {
		return replyId;
	}
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	public String getRepContents() {
		return repContents;
	}
	public void setRepContents(String repContents) {
		this.repContents = repContents;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
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

	@Override
	public String toString() {
		return "ReplyVO [replyId=" + replyId + ", repContents=" + repContents + ", time=" + time + ", empNo=" + empNo
				+ ", empName=" + empName + ", boardId=" + boardId + ", first=" + first + ", last=" + last + "]";
	}
			
}
