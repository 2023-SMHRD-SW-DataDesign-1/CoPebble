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

@WebServlet("/FamilyKeyCon")
public class FamilyKeyCon extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

	   System.out.println("[Familykey]");
		request.setCharacterEncoding("UTF-8");

		String FAMILY_KEY = request.getParameter("FAMILY_KEY");
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO) session.getAttribute("info");

		String ID = info.getID();
		String PW = info.getPW();
		String NAME = info.getNAME();

		session.setAttribute("FAMILY_KEY", FAMILY_KEY);

		System.out.println(ID);
		System.out.println(PW);
		System.out.println(NAME);
		System.out.println("패밀리콘 패밀리키 : " + FAMILY_KEY);

		// 4. (MemberDTO에서의)family메소드 호출

		MemberDTO dto = new MemberDTO(ID, FAMILY_KEY, PW, NAME);
		MemberDAO dao = new MemberDAO();
		int row1 = 0;
		String check = dao.CheckFM(FAMILY_KEY);
		if (check == null) {
			int row = dao.insertfamilykey(FAMILY_KEY);
			row1 = dao.familykey(dto);
			if (row1 > 0) {
				
				System.out.println("패밀리테이블 insert 성공");
				System.out.println("패밀리키 업데이트 성공");

				response.sendRedirect("Main.jsp");

				// 수정 성공 시 session의 info도 업데이트

				request.getSession().setAttribute("info", dto);

			}

			else {

				System.out.println("입력한 정보가 일치하지 않습니다");

				response.sendRedirect("FamilyKey.jsp");

			}

		} else {
			row1 = dao.familykey(dto);
			if (row1 > 0) {

				System.out.println("패밀리키 업데이트 성공");

				response.sendRedirect("Main.jsp");

				// 수정 성공 시 session의 info도 업데이트

				request.getSession().setAttribute("info", dto);

			}

			else {

				System.out.println("입력한 정보가 일치하지 않습니다");

				response.sendRedirect("FamilyKey.jsp");

			}
		}

   }
}