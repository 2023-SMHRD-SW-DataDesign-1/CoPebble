package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO;

@WebServlet("/DeleteMemberCon")
public class DeleteMemberCon extends HttpServlet {
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      System.out.println("[DeleteMemberCon]");
   
      String ID = request.getParameter("ID");
      System.out.println("ID: " + ID);
      
      
      int row = new MemberDAO().deleteMember(ID);
      
      // 4. 결과에 따라서 성공실패 판단
      if (row > 0) {
         System.out.println("오라클 회원삭제 성공");
      }
      else {
         System.out.println("오라클 회원삭제 성공");
      }
      
      // 5. 페이지 이동
      response.setCharacterEncoding("UTF-8");
      response.getWriter().print("row :"+row + " (0이면 통신실패, 1이면 변경성공)");
      
      response.sendRedirect("./IntroModal.jsp");
      
   }

}