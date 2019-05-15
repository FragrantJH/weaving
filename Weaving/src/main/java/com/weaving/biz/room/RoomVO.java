package com.weaving.biz.room;

public class RoomVO {
	private int room_id;
	private String room_name;
	private int reserv_id;
	private int emp_no;
	private String start_time;
	private int use_hour;
	private String description;
	
	
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public int getReserv_id() {
		return reserv_id;
	}
	public void setReserv_id(int reserv_id) {
		this.reserv_id = reserv_id;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public int getUse_hour() {
		return use_hour;
	}
	public void setUse_hour(int use_hour) {
		this.use_hour = use_hour;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
