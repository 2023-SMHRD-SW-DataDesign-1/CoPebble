package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
      
      if(row > 0) {
         result = "오라클 저장 성공";
      }else {
         result = "오라클 저장 실패";
      }
      
      response.setCharacterEncoding("UTF-8");
      response.getWriter().print(result);
   }

}