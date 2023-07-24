package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/calendarDataCon")
public class calendarDataCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String jsonData = request.getParameter("alldata");
		System.out.println("수신한 데이터: " + jsonData);

		// 1. DB 연결하기?

		// 2. DB 저장된 테이블 초기화 하기?

		// JSON 파싱
		JSONArray dataArr = new JSONArray(jsonData);

		for (int i = 0; i < dataArr.length(); i++) {
			JSONObject dataObj = dataArr.getJSONObject(i);

			String title = dataObj.getString("title");
			String start = dataObj.getString("start");
			String end = dataObj.getString("end");
			String color = dataObj.getString("color");
			System.out.println(title + " " + start + " " + end + " " + color);
			// SQL 추가 코드 입력 하기?
			// DAO
		}

		// 3. 새로운 데이터 저장하기
		// 4. 완?

	}
}