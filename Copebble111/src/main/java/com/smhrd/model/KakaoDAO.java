package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.sqlSessionManager;

public class KakaoDAO {

	static SqlSessionFactory sqlSessionFactory = sqlSessionManager.getSqlSession();
	
	//카카오로 회원가입하는 DTO
	public String KakaoLoginCheck(KakaoDTO dto) {
		SqlSession session =  sqlSessionFactory.openSession(true);
		String id = session.selectOne("KakaoLoginCheck", dto);
		session.close();
		return id;
	}
	
	//카카오로 로그인하는 DTO
	public int KakaoLogin(KakaoDTO dto) {
		SqlSession session =  sqlSessionFactory.openSession(true);
		int row = session.insert("KakaoLogin", dto);
		session.close();
		return row;
	}
	
}
