package com.smhrd.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.sqlSessionManager;

public class calendarDAO {
	static SqlSessionFactory sqlSessionFactory = sqlSessionManager.getSqlSession();

	// 캘린더 삭제
	public void deleteCalendar(String Family_key) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.delete("deleteCalendar", Family_key);
		session.close();
	}

	// 캘린더 업데이트
	public int updateCalendar(calendarDTO calendarDTO) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.insert("updateCalendar", calendarDTO);
		session.close();
		return row;
	}

	// 캘린더 조회
	public static ArrayList<calendarDTO> selectCalendar(String Family_key) {
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<calendarDTO> calendar_list = (ArrayList) session.selectList("selectCalendar", Family_key);
		session.close();
		return calendar_list;
	}
}
