package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.sqlSessionManager;

public class MemberDAO {

   static SqlSessionFactory sqlSessionFactory = sqlSessionManager.getSqlSession();

   public int join(MemberDTO dto) {
      SqlSession session = sqlSessionFactory.openSession(true);
      int row = session.insert("join", dto);
      session.close();
      return row;
   }

   public MemberDTO login(MemberDTO dto) {
      SqlSession session = sqlSessionFactory.openSession(true);
      MemberDTO info = session.selectOne("login", dto);
      session.close();
      return info;
   }

   public int update(MemberDTO dto) { //String PW로 받아도 됨
      SqlSession session = sqlSessionFactory.openSession(true);
      int row = session.insert("update", dto);
      session.close();
      return row;
   }
   
   public int deleteMember (String ID) {
      SqlSession session = sqlSessionFactory.openSession(true);
      int row = session.delete("deleteMember", ID);
      session.close();
      return row;
   }
   
   public int familykey(MemberDTO dto) { //로그인 후에 member 테이블에 넣는 용이라 update
       SqlSession session = sqlSessionFactory.openSession(true); 
       int row = session.update("familykey", dto); 
       session.close(); 
       return row; 
       } 
   
   public int insertfamilykey(String FAMILY_KEY) {  //family 테이블에 넣는 용 insert
	   SqlSession session = sqlSessionFactory.openSession(true); 
	   int row = session.insert("insertfamilykey", FAMILY_KEY); 
	   session.close(); 
	   return row; 
   } 
   
   public String CheckFM(String FM) {
	      SqlSession session = sqlSessionFactory.openSession(true);
	      String check = session.selectOne("CheckFM", FM);
	      session.close();
	      return check;
	   }

}




