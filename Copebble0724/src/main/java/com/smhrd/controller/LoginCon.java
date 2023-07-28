package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberDTO;

@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("[LoginCon]");

		request.setCharacterEncoding("UTF-8");

		String ID = request.getParameter("ID");
		String PW = request.getParameter("PW");

		System.out.println("ID: " + ID);
		System.out.println("PW: " + PW);

		// DB 확인
		MemberDAO dao = new MemberDAO();
		MemberDTO info = dao.login(new MemberDTO(ID, PW));

		String result;
		if (info != null) {
			result = "";
			System.out.println("오라클 로그인 연결 성공");
			// session객체 생성
			HttpSession session = request.getSession();
			session.setAttribute("info", info);
		} else {
			result = "오라클 로그인 연결 실패";
			System.out.println("오라클 로그인 연결 실패");
		}

		String FAMILY_KEY = info.getFAMILY_KEY();
		
		HttpSession session = request.getSession();
		session.setAttribute("FAMILY_KEY", FAMILY_KEY);
		System.out.println("FAMILY_KEY : "+ FAMILY_KEY);
		
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(result);

	}

}