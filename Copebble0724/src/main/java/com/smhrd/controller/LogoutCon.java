package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutCon extends HttpServlet {
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      System.out.println("[LogoutCon]");
      
      HttpSession session = request.getSession();
      System.out.println("삭제 전 :"+session.getAttribute("info"));
      session.removeAttribute("info"); // 세션삭제
      System.out.println("삭제 후: "+session.getAttribute("info"));
      response.sendRedirect("introModal.jsp");

   }

}