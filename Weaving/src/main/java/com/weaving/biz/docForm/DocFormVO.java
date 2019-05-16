package com.weaving.biz.docForm;

public class DocFormVO {

	private int rowNum;
	private int formId;
	private String formName;
	private String description;
	private String formContents;
	private int first;
	private int last;

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public int getFormId() {
		return formId;
	}

	public String getFormName() {
		return formName;
	}

	public String getDescription() {
		return description;
	}

	public String getFormContents() {
		return formContents;
	}

	public void setFormId(int formId) {
		this.formId = formId;
	}

	public void setFormName(String formName) {
		this.formName = formName;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setFormContents(String formContents) {
		this.formContents = formContents;
	}

	public int getFirst() {
		return first;
	}

	public int getLast() {
		return last;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public void setLast(int last) {
		this.last = last;
	}

	@Override
	public String toString() {
		return "DocFormVO [rowNum=" + rowNum + ", formId=" + formId + ", formName=" + formName + ", description="
				+ description + ", formContents=" + formContents + ", first=" + first + ", last=" + last + "]";
	}

}
