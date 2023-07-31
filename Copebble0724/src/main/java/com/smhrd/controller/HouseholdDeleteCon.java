package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.HouseholdDAO;
import com.smhrd.model.HouseholdDTO;

@WebServlet("/HouseholdDeleteCon")
public class HouseholdDeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("청소 삭제");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		String WORK = request.getParameter("WORK");	
        int endIndex = WORK.length() - 3;
        if (endIndex >= 0) {
        	WORK = WORK.substring(0, endIndex);
        }
        System.out.println(WORK);
		
		String FAMILY_KEY = (String) session.getAttribute("FAMILY_KEY");
		System.out.println(FAMILY_KEY);

		int row = new HouseholdDAO().deleteHousehold(new HouseholdDTO(FAMILY_KEY, WORK));
		if (row > 0) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("삭제 실패");
		}

	}
}