package com.weaving.biz.todo;

import java.util.List;

public interface ToDoService {
	
	void insertTodo(ToDoVO vo);

	void deleteTodo(ToDoVO vo);

	List<ToDoVO> getTodoList(int empNo);
}
