package com.weaving.biz.board;

import java.sql.Date;

public class BoardVO {
	private int board_id;
	private int emp_no;
	private String title;
	private String board_contents;
	private Date time;
	private char board_type;
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBoard_contents() {
		return board_contents;
	}
	public void setBoard_contents(String board_contents) {
		this.board_contents = board_contents;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public char getBoard_type() {
		return board_type;
	}
	public void setBoard_type(char board_type) {
		this.board_type = board_type;
	}
	
	
	
	
}
