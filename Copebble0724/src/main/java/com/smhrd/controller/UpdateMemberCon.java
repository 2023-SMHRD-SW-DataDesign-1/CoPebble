package com.smhrd.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberDTO;

import oracle.security.crypto.core.Padding.ID;

@WebServlet("/UpdateMemberCon")
public class UpdateMemberCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("[updatememberCon]");

		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		// 데이터 받아오기
		String ID = request.getParameter("ID");
		String PW = request.getParameter("PW");

		// 4. (MemberDTO에서의)update메소드 호출

		MemberDTO UpdateMember = new MemberDTO(ID, PW);

		int row = new MemberDAO().update(UpdateMember);

		// 5. update 결과값에 따라 출력

		String moveURL = "";

		if (row > 0) {

			System.out.println("회원정보 수정 성공");

			moveURL = "../UpdateMember.jsp";

			// 수정 성공 시 session의 info도 업데이트

			request.getSession().setAttribute(ID, PW);

		}

		else {

			System.out.println("입력한 정보가 일치하지 않습니다");

			moveURL = "./UpdateMember.jsp";

		}

	}

}
