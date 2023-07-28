package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.model.MemoDAO;
import com.smhrd.model.MemoDTO;

@WebServlet("/MemoSelectCon")
public class MemoSelectCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("메모 데이터 수신 확인");

        HttpSession session = request.getSession();
	    String FAMILY_KEY = (String) session.getAttribute("FAMILY_KEY");
		System.out.println(FAMILY_KEY);
		String FK = FAMILY_KEY;
		
		ArrayList<MemoDTO> memoList = MemoDAO.showMemo(FK);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(new Gson().toJson(memoList));
	}
}
