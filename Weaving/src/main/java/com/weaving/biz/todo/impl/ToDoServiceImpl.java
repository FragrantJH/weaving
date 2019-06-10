package com.weaving.biz.todo.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weaving.biz.todo.ToDoService;
import com.weaving.biz.todo.ToDoVO;

@Service("TodoService")
public class ToDoServiceImpl implements ToDoService {

	@Autowired
	ToDoDAO mybatis;
	
	@Override
	public void insertTodo(ToDoVO vo) {
		mybatis.insert(vo);
	}

	@Override
	public void deleteTodo(ToDoVO vo) {
		mybatis.delete(vo);
	}

	@Override
	public List<ToDoVO> getTodoList(int empNo) {
		return mybatis.getTodoList(empNo);
	}
}
