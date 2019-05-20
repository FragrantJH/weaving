package com.weaving.biz.cal;

import java.util.Date;

public class CalVO {

	private int cal_id;
	private int group_id;
	private Integer emp_no;
	private String title;
	private char allday;
	private Date start_date;
	private Date end_date;
	private String back_color;
	private Date create_date;
	
	public int getCal_id() {
		return cal_id;
	}
	public int getGroup_id() {
		return group_id;
	}
	public Integer getEmp_no() {
		return emp_no;
	}
	public String getTitle() {
		return title;
	}
	public char getAllday() {
		return allday;
	}
	public Date getStart_date() {
		return start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public String getBack_color() {
		return back_color;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCal_id(int cal_id) {
		this.cal_id = cal_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public void setEmp_no(Integer emp_no) {
		this.emp_no = emp_no;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setAllday(char allday) {
		this.allday = allday;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public void setBack_color(String back_color) {
		this.back_color = back_color;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	
	@Override
	public String toString() {
		return "CalVO [cal_id=" + cal_id + ", group_id=" + group_id + ", emp_no=" + emp_no + ", title=" + title
				+ ", allday=" + allday + ", start_date=" + start_date + ", end_date=" + end_date + ", back_color="
				+ back_color + ", create_date=" + create_date + "]";
	}
	
	
}
