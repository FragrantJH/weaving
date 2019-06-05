package com.weaving.biz.todo;

public class ToDoVO {

	private int todoId;
	private int empNo;
	private String content;
	private char done;

	public int getTodoId() {
		return todoId;
	}

	public void setTodoId(int todoId) {
		this.todoId = todoId;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public char getDone() {
		return done;
	}

	public void setDone(char done) {
		this.done = done;
	}

	@Override
	public String toString() {
		return "TodoVO [todoId=" + todoId + ", empNo=" + empNo + ", content=" + content + ", done=" + done + "]";
	}
	
}
