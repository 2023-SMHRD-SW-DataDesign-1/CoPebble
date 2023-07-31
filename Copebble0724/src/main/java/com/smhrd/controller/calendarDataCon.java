package com.smhrd.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import com.smhrd.model.MemberDTO;
import com.smhrd.model.calendarDAO;
import com.smhrd.model.calendarDTO;

@WebServlet("/saveData")
public class calendarDataCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String jsonData = request.getParameter("alldata");

		HttpSession session = request.getSession();
		String FAMILY_KEY = (String) session.getAttribute("FAMILY_KEY");
		System.out.println(FAMILY_KEY);

		String ID = "📃";

		String FK = FAMILY_KEY;

		String CAL = "C";
		int num = 1;
		try {
			new calendarDAO().deleteCalendar(FK);
			System.out.println("캘린더 초기화 완료!");
		} catch (Exception e) {
			System.err.println("캘린더 초기화 실패: " + e.getMessage());
			e.printStackTrace();
		}

		// JSON 파싱
		JSONArray dataArr = new JSONArray(jsonData);
		for (int i = 0; i < dataArr.length(); i++) {
			JSONObject dataObj = dataArr.getJSONObject(i);

			String title = dataObj.getString("title");
			String start = dataObj.getString("start");
			String end = dataObj.getString("end");
			String color = dataObj.getString("color");

			DateTimeFormatter formatter = DateTimeFormatter.ISO_DATE_TIME;
			DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDateTime enddate = LocalDateTime.parse(end, formatter);
			LocalDateTime startdate = LocalDateTime.parse(start, formatter);

			end = enddate.format(dateFormatter);
			start = startdate.format(dateFormatter);

			System.out.println(title + " " + start + " " + end + " " + FK + " " + color);

			int row = new calendarDAO().updateCalendar(new calendarDTO(num, FK, CAL, ID, title, start, end, color));
			if (row > 0) {
				System.out.println("캘린더 업데이트 성공");
			} else {
				System.out.println("캘린더 업데이트 실패");
			}
		}
	}
}