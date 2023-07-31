package com.smhrd.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.sqlSessionManager;

public class HouseholdDAO {
	static SqlSessionFactory sqlSessionFactory = sqlSessionManager.getSqlSession();

    // 집안일 등록
    public int addHousehold(HouseholdDTO dto) {
       SqlSession session = sqlSessionFactory.openSession(true);
       int row = session.insert("addHousehold", dto);
       session.close();
       return row;
    }
    
    // 집안일 보여주기(오래된 순)
    public static ArrayList<HouseholdDTO> showHousehold(String FAMILY_KEY){
       SqlSession session = sqlSessionFactory.openSession(true);
       ArrayList<HouseholdDTO> household_list = (ArrayList)session.selectList("showHousehold", FAMILY_KEY);
       session.close();
       return household_list;
    }
   
    // select * from web_board order by B_date;

    
    // 집안일 삭제 메소드
    public int deleteHousehold(HouseholdDTO dto) {
       SqlSession session = sqlSessionFactory.openSession(true);      
       int row = session.delete("deleteHousehold", dto);
       session.close();
       return row;
    }

}
