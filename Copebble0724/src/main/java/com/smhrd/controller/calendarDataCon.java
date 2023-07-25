package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.smhrd.model.calendarDAO;
import com.smhrd.model.calendarDTO;

@WebServlet("/saveData")
public class calendarDataCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String jsonData = request.getParameter("alldata");
		System.out.println("수신한 데이터: " + jsonData);
		
		
		
		
// 패밀리키 값 and id 정보 가져오기
		String FK = "test0001";
		String CAL = "CALENAR";
		String ID = "TEST01";
		int num = 1;
		try {
		    new calendarDAO().deleteCalendar(FK);
		    System.out.println("초기화 완료!");
		} catch (Exception e) {
		    System.err.println("초기화 실패: " + e.getMessage());
		    e.printStackTrace();
		}

		// JSON 파싱
		JSONArray dataArr = new JSONArray(jsonData);
		System.out.println("파싱완료!");
		for (int i = 0; i < dataArr.length(); i++) {
			JSONObject dataObj = dataArr.getJSONObject(i);

			String title = dataObj.getString("title");
			String start = dataObj.getString("start");
			String end = dataObj.getString("end");
			String color = dataObj.getString("color");
			System.out.println(title + " " + start + " " + end + " " + color);
				
			int row = new calendarDAO().updateCalendar(new calendarDTO(num,FK,CAL,ID,title,start,end,color));
			 if(row>0) {
		    	  System.out.println("업데이트 성공");
		      }else {
		    	  System.out.println("업데이트 실패");	    	  
		      }
		}
	}
}