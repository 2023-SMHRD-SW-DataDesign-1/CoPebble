package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.sqlSessionManager;

public class calendarDAO {
	static SqlSessionFactory sqlSessionFactory = sqlSessionManager.getSqlSession();
	
	public int deleteCalendar(String FK) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.delete("deleteCalender", FK);
		session.close();
		return row;
	}
}
