package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberDTO;

@WebServlet("/UpdateCon")
public class UpdateCon extends HttpServlet {
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      System.out.println("[UpdateCon]");
      
      request.setCharacterEncoding("UTF-8");
      
      String ID = request.getParameter("ID");
      String PW = request.getParameter("PW");
      
      System.out.println("ID: " +ID);
      System.out.println("PW: "+PW);

      // DB에 저장
      MemberDTO info = new MemberDTO(ID, PW);
      int row = new MemberDAO().update(info);

      String moveURL = "";
      if (row > 0) {
         System.out.println("오라클 회원정보 수정 성공");
         moveURL = "Main.jsp";
         request.getSession().setAttribute("info", info);

      } else {
         System.out.println("오라클 회원정보 수정 실패");
         moveURL = "MyPage.jsp";
      }
      
      response.setCharacterEncoding("UTF-8");
      response.getWriter().print("row :"+row + " (0이면 통신실패, 1이면 변경성공)");
      
       
      
   }

}