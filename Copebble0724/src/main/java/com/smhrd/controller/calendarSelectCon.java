package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.model.calendarDAO;
import com.smhrd.model.calendarDTO;
import com.google.gson.Gson; // Import Gson library for JSON conversion

@WebServlet("/calendarSelectCon")
public class calendarSelectCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("캘린더 데이터 수신 확인");
		String FK = "test0001";
		ArrayList<calendarDTO> calendar_list = calendarDAO.selectCalendar(FK);

		Gson gson = new Gson();
		String json = gson.toJson(calendar_list);

		response.setContentType("application/json");

		response.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();

	}
}