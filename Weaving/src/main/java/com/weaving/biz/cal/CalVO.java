package com.weaving.biz.cal;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class CalVO {
	private String id;
	@JsonIgnore
	private String groupId;
	private Boolean allDay = false;
	private String start;
	private String end;
	private String title;
	private String backgroundColor;
	private Boolean editable = true;
	private Integer empNo;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public Boolean getAllDay() {
		return allDay;
	}

	public void setAllDay(Boolean allDay) {
		this.allDay = allDay;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

	public Boolean getEditable() {
		return editable;
	}

	public void setEditable(Boolean editable) {
		this.editable = editable;
	}

	public Integer getEmpNo() {
		return empNo;
	}

	public void setEmpNo(Integer empNo) {
		this.empNo = empNo;
	}

	@Override
	public String toString() {
		return "CalVO [id=" + id + ", groupId=" + groupId + ", allDay=" + allDay + ", start=" + start + ", end=" + end
				+ ", title=" + title + ", backgroundColor=" + backgroundColor + ", editable=" + editable + ", empNo="
				+ empNo + "]";
	}

}
