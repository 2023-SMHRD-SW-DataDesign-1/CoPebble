package com.smhrd.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.sqlSessionManager;

public class DiaryDAO {
	
static SqlSessionFactory sqlSessionFactory = sqlSessionManager.getSqlSession();
	
	// 다이어리 등록 메소드
	public int writeDiary(DiaryDTO dto) {
		SqlSession session =  sqlSessionFactory.openSession(true);
		int row = session.insert("writeDiary", dto);
		session.close();
		return row;
	}
	
	// 다이어리 전체 조회 메소드
	// select * from INFANT_DIARY2 order by b_date;
	public static ArrayList<DiaryDTO> showDiary(){
		SqlSession session =  sqlSessionFactory.openSession(true);
		ArrayList<DiaryDTO> DIARY_list = (ArrayList)session.selectList("showDiary");
		session.close();
		return DIARY_list;
	}
	
	// 다이어리 세부내용 조회 메소드
	public static DiaryDTO showDiaryOne(int num) {
		SqlSession session =  sqlSessionFactory.openSession(true);
		DiaryDTO DiaryOne = session.selectOne("showDiaryOne", num);
		session.close();
		return DiaryOne;
	}
	
	// 다이어리 삭제 메소드
	public int deleteDiary(int num) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.delete("deleteDiary", num);
		session.close();
		return row;
	}
	
	

}
