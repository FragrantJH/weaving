package com.weaving.biz.board;

import java.sql.Date;

public class BoardVO {
	private int boardId;
	private int empNo;
	private String empName;
	private String title;
	private String boardContents;
	private Date time;
	private char boardType;

	
	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBoardContents() {
		return boardContents;
	}

	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public char getBoardType() {
		return boardType;
	}

	public void setBoardType(char boardType) {
		this.boardType = boardType;
	}

	@Override
	public String toString() {
		return "BoardVO [boardId=" + boardId + ", empNo=" + empNo + ", title=" + title + ", boardContents="
				+ boardContents + ", time=" + time + ", boardType=" + boardType + "]";
	}
	
}
