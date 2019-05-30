package com.weaving.biz.reply;

import java.sql.Timestamp;

public class ReplyVO {
	private int replyId;
	private String repContents;
	private Timestamp time;
	private int empNo;
	private String empName;
	private int boardId;

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

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
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

	@Override
	public String toString() {
		return "ReplyVO [replyId=" + replyId + ", repContents=" + repContents + ", time=" + time + ", empNo=" + empNo
				+ ", empName=" + empName + ", boardId=" + boardId + "]";
	}

}
