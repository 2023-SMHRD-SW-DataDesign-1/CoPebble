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

@WebServlet("/JoinCon")
public class JoinCon extends HttpServlet {

   protected void service(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      System.out.println("[JoinCon]");

      request.setCharacterEncoding("UTF-8");

      String ID = request.getParameter("ID");
      String PW = request.getParameter("PW");
      String NAME = request.getParameter("NAME");

      System.out.println("ID: " + ID);
      System.out.println("PW: " + PW);
      System.out.println("NAME: " + NAME);

      // DB에 저장
      MemberDTO dto = new MemberDTO(ID, PW, NAME);
      MemberDAO dao = new MemberDAO();
      int row = dao.join(dto);

      String result;

      if (row > 0) {
         result = "오라클 저장 성공";
         //ID값 보내기
          // MemberDTO 객체 생성 및 값 설정
          MemberDTO info = new MemberDTO(ID, PW, NAME);
          // session객체 생성
          HttpSession session = request.getSession();
          // session 데이터 저장
          session.setAttribute("info", info);
          // 다른 JSP로 페이지 이동
          response.sendRedirect("./FamilyKey.jsp");
      } else {
         result = "오라클 저장 실패";
      }

      response.setCharacterEncoding("UTF-8");
      response.getWriter().print(result);
      
      


}
}