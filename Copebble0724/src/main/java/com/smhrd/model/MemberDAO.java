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
   
   public int familykey(MemberDTO dto) { 
       SqlSession session = sqlSessionFactory.openSession(true); 
       int row = session.insert("familykey", dto); 
       session.close(); 
       return row; 
       } 

}