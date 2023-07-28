package com.smhrd.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.TodoDAO;
import com.smhrd.model.TodoDTO;

@WebServlet("/todoDataCon")
public class todoDataCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		String eventTodoTitle = request.getParameter("title");
		String eventTodoStart = request.getParameter("start");
		String eventTodoEnd = request.getParameter("end");
		String eventTodoManager = request.getParameter("manager");
		
		try {
            // SimpleDateFormat을 사용하여 문자열을 날짜로 파싱
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date date = sdf.parse(eventTodoEnd);

            // Calendar를 사용하여 날짜 조작
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            calendar.add(Calendar.DATE, 1); // 날짜를 +1일 만큼 더함

            // 변경된 날짜를 다시 문자열로 포맷
            String modifiedDate = sdf.format(calendar.getTime());
            eventTodoEnd = modifiedDate;
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		
		System.out.println("TODO 저장용 데이터 수신 - Title: " + eventTodoTitle + ", Start: " + eventTodoStart + ", End: "+ eventTodoEnd + ", Manager: " + eventTodoManager);
		
		int num = 1;
		 String FK = "test0001";
		 String ASSORT = "T";
		 String color = "0000";

			int row = new TodoDAO().writeTodo(new TodoDTO(num,FK,ASSORT,eventTodoManager,eventTodoTitle,eventTodoStart,eventTodoEnd, color));
			 if(row>0) {
		    	  System.out.println("가족알림장 저장 성공");
		      }else {
		    	  System.out.println("가족알림장 저장 실패");	    	  
		      }
		
		
		
	}
}
