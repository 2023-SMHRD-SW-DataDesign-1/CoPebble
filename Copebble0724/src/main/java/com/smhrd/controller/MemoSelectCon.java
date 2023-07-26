package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.model.MemoDAO;
import com.smhrd.model.MemoDTO;

@WebServlet("/MemoSelectCon")
public class MemoSelectCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String FK = "test0001";
		ArrayList<MemoDTO> memoList = MemoDAO.showMemo(FK);

		// 메모 데이터를 JSON 형식으로 변환하여 클라이언트에게 응답합니다.
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(new Gson().toJson(memoList));
	}
}
