package com.weaving.biz.docForm;

public class DocFormVO {

	private int formId;
	private String formName;
	private String description;
	private String formContents;
	
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
	
	@Override
	public String toString() {
		return "DocFormVO [formId=" + formId + ", formName=" + formName + ", description=" + description
				+ ", formContents=" + formContents + "]";
	}
	
	
}
