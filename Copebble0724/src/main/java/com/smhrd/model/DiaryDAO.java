package com.smhrd.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.sqlSessionManager;

public class DiaryDAO {

	static SqlSessionFactory sqlSessionFactory = sqlSessionManager.getSqlSession();

	// 다이어리 등록 메소드
	public int writeDiary(DiaryDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.insert("writeDiary", dto);
		session.close();
		return row;
	}

	// 다이어리 전체 조회 메소드 오래된순
	// select * from INFANT_DIARY where FAMILY_KEY=#{FAMILY_KEY} order by NUM
	public static ArrayList<DiaryDTO> showDiary(String FAMILY_KEY) {
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<DiaryDTO> DIARY_list = (ArrayList) session.selectList("showDiary",FAMILY_KEY);
		session.close();
		return DIARY_list;
	}

	// 다이어리 전체 조회 메소드 최신순
	// select * from INFANT_DIARY order by NUM DESC
	public static ArrayList<DiaryDTO> showDiary_DESC(String FAMILY_KEY) {
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<DiaryDTO> DIARY_list = (ArrayList) session.selectList("showDiary_DESC",FAMILY_KEY);
		session.close();
		return DIARY_list;
	}

	// 다이어리 세부내용 조회 메소드
	public static DiaryDTO showDiaryOne(int num) {
		SqlSession session = sqlSessionFactory.openSession(true);
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

	public int updateDiary(DiaryDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.update("updateDiary", dto);
		session.close();
		return row;
	}

}
