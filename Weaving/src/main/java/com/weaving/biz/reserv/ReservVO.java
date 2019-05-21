package com.weaving.biz.reserv;

public class ReservVO {
	private int reservId;
	private int roomId;
	private int empNo;
	private String reservDate;
	private String startTime;
	private String endTime;
	private String description;
	private String startDate;
	private String endDate;

	public int getReservId() {
		return reservId;
	}

	public void setReservId(int reservId) {
		this.reservId = reservId;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public String getReservDate() {
		return reservDate;
	}

	public void setReservDate(String reservDate) {
		this.reservDate = reservDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "ReservVO [reservId=" + reservId + ", roomId=" + roomId + ", empNo=" + empNo + ", reservDate="
				+ reservDate + ", startTime=" + startTime + ", endTime=" + endTime + ", description=" + description
				+ ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}

}
