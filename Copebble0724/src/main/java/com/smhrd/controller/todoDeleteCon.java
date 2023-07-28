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

@WebServlet("/todoDeleteCon")
public class todoDeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String eventTodoTitle = request.getParameter("title");
		String eventTodoStart = request.getParameter("start");
		String eventTodoEnd = request.getParameter("end");
		String eventTodoManager = request.getParameter("name");
		
		try {
            // SimpleDateFormat을 사용하여 문자열을 날짜로 파싱
            SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
            Date date = sdf.parse(eventTodoEnd);

            // Calendar를 사용하여 날짜 조작
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            calendar.add(Calendar.DATE, 1); 

            // 변경된 날짜를 다시 문자열로 포맷
            String modifiedDate = sdf.format(calendar.getTime());
            eventTodoEnd = modifiedDate;
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		
		
		
		int currentYear = Calendar.getInstance().get(Calendar.YEAR);
		
		
			
		eventTodoStart = currentYear + "-" + eventTodoStart;
		eventTodoEnd = currentYear + "-" + eventTodoEnd;
		System.out.println("TODO 삭제용 데이터 수신 - Title: " + eventTodoTitle + ", Start: " + eventTodoStart + ", End: "
				+ eventTodoEnd + ", Manager: " + eventTodoManager);
		int n = 0;
		int num = 1;
		String FK = "test0001";
		String ASSORT = "T";
		String color = "0000";

		int row = new TodoDAO().deleteTodo(
				new TodoDTO(num, FK, ASSORT, eventTodoManager, eventTodoTitle, eventTodoStart, eventTodoEnd, color));
		if (row > 0) {
			System.out.println("가족알림장 삭제 성공");
		} else {
			System.out.println("가족알림장 삭제 실패");
			ASSORT = "C";
			String[] colors = { "#808080", "#00FF00", "#50bcdf", "#FFC0CB", "#FFFF00" };
			int colorIndex = 0;
			
			while (true) {
				color = colors[colorIndex];
				colorIndex = (colorIndex + 1) % colors.length;

				row = new TodoDAO().deleteTodo(new TodoDTO(num, FK, ASSORT, eventTodoManager, eventTodoTitle,
						eventTodoStart, eventTodoEnd, color));
				if (row > 0) {
					System.out.println("가족알림장 캘린더 연동 삭제 성공");
					break;
				} else {
					System.out.println("가족알림장 캘린더 연동 삭제 실패");
				}
				n = n + 1;
				if (n > 5) {
					break;
				}
			}
		}

	}
}
