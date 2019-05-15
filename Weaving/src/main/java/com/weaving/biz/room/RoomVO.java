package com.weaving.biz.room;

public class RoomVO {
	private int roomId;
	private String roomName;
	private int reservId;
	private int empNo;
	private String startTime;
	private int useHour;
	private String description;
	
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getReservId() {
		return reservId;
	}
	public void setReservId(int reservId) {
		this.reservId = reservId;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public int getUseHour() {
		return useHour;
	}
	public void setUseHour(int useHour) {
		this.useHour = useHour;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
