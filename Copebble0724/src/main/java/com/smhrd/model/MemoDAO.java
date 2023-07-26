package com.smhrd.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.sqlSessionManager;

public class MemoDAO {
	static SqlSessionFactory sqlSessionFactory = sqlSessionManager.getSqlSession();

	// 메모 등록 메소드
	public int writeMemo(MemoDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.insert("insertMemo", dto);
		session.close();
		return row;
	}

	// 메모 삭제 메소드
	public int deleteMemo(MemoDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.delete("deleteMemo", dto);
		System.out.println("메모 삭제 메소드");
		session.close();
		return row;
	}

	// 메모 전체 조회 메소드
	public static ArrayList<MemoDTO> showMemo(String Family_key) {
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<MemoDTO> Memo_list = (ArrayList) session.selectList("showMemo", Family_key);
		session.close();
		return Memo_list;
	}

}
