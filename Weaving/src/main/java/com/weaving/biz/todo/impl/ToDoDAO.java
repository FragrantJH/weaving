package com.weaving.biz.todo.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weaving.biz.todo.ToDoVO;

@Repository
public class ToDoDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public void insert(ToDoVO vo) {
		mybatis.insert("ToDoDAO.insertTodo", vo);
	}
		
	public void delete(ToDoVO vo) {
		mybatis.insert("ToDoDAO.deleteTodo", vo);
	}
	
	public List<ToDoVO> getTodoList(int empNo) {
		return mybatis.selectList("ToDoDAO.selectTodo", empNo);
		
	}

}
