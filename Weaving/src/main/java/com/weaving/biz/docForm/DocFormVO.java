package com.weaving.biz.docForm;

public class DocFormVO {

	private int form_id;
	private String form_name;
	private String description;
	private String form_contents;
	
	public int getForm_id() {
		return form_id;
	}
	public String getForm_name() {
		return form_name;
	}
	public String getDescription() {
		return description;
	}
	public String getForm_contents() {
		return form_contents;
	}
	public void setForm_id(int form_id) {
		this.form_id = form_id;
	}
	public void setForm_name(String form_name) {
		this.form_name = form_name;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setForm_contents(String form_contents) {
		this.form_contents = form_contents;
	}
	@Override
	public String toString() {
		return "DocFormVO [form_id=" + form_id + ", form_name=" + form_name + ", description=" + description
				+ ", form_contents=" + form_contents + "]";
	}
}
