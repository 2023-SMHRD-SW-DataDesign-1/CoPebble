package com.smhrd.model;

import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.sqlSessionManager;

public class MemberDAO {
	static SqlSessionFactory sqlSessionFactory = sqlSessionManager.getSqlSession();
	
	// update메소드
		public int update(MemberDTO dto) { 
			SqlSession session = sqlSessionFactory.openSession(true); 
			int row = session.insert("update", dto); 
			session.close(); 
			return row; 
			} 

		
		
}
