package com.smhrd.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.sqlSessionManager;

public class TodoDAO {
	static SqlSessionFactory sqlSessionFactory = sqlSessionManager.getSqlSession();

	// Todo 생성
	public int writeTodo(TodoDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.insert("insertTodo", dto);
		System.out.println("Todo 생성 메소드");
		session.close();
		return row;
	}

	// Todo 조회삭제
	public int deleteTodo(TodoDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.delete("deleteTodo", dto);
		System.out.println("Todo 삭제 메소드");
		session.close();
		return row;
	}

	// Todo 조회
	public static ArrayList<TodoDTO> showTodo(String Family_key) {
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<TodoDTO> Todo_list = (ArrayList) session.selectList("showTodo", Family_key);
		// System.out.println("Todo 조회 메소드");
		session.close();
		return Todo_list;
	}
}
