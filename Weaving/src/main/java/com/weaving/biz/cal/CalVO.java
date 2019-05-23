package com.weaving.biz.cal;

import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class CalVO {
	private String id;
	private Boolean allDay;
	private String start;
	private String end;
	private String title;
	private String backgroundColor;
	private Boolean editable = true;
	private String description;
	private Map<String, Object> extendedProps;
	private Integer empNo;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Map<String, Object> getExtendedProps() {
		
		if(extendedProps == null) {
			extendedProps = new HashMap<String, Object>();
		}
		
		if(extendedProps.containsKey("description") == false) {
			extendedProps.put("description", this.description);
		}
		
		return extendedProps;
	}

	@Override
	public String toString() {
		return "CalVO [id=" + id + ", allDay=" + allDay + ", start=" + start + ", end=" + end + ", title=" + title
				+ ", backgroundColor=" + backgroundColor + ", editable=" + editable + ", description=" + description
				+ ", extendedProps=" + extendedProps + ", empNo=" + empNo + "]";
	}
	

}
