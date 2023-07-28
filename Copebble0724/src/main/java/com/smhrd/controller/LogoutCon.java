package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutCon")
public class LogoutCon extends HttpServlet {
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      System.out.println("[LogoutCon]");
      
      HttpSession session = request.getSession();
      System.out.println("삭제 전 :"+session.getAttribute("info"));
      session.removeAttribute("info"); // 세션삭제
      System.out.println("삭제 후: "+session.getAttribute("info"));
      
      System.out.println("토큰삭제 전 :"+session.getAttribute("accesstoken"));
      System.out.println(session.getAttribute("ID"));
      System.out.println(session.getAttribute("NAME"));
      session.removeAttribute("accesstoken"); // 세션삭제
      session.removeAttribute("ID"); // 세션삭제
      session.removeAttribute("NAME"); // 세션삭제
      session.removeAttribute("FAMLIY_KEY"); // 세션삭제
      System.out.println("삭제 후 토큰: "+session.getAttribute("accesstoken"));
      System.out.println("ID:"+session.getAttribute("ID"));
      System.out.println("NAME:"+session.getAttribute("NAME"));
      System.out.println("FAMLIY_KEY:"+session.getAttribute("FAMLIY_KEY"));
      response.sendRedirect("IntroModal.jsp");

   }

}