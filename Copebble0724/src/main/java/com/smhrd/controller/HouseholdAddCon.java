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
import com.smhrd.model.MemberDTO;

/**
 * Servlet implementation class HouseholdAddCon
 */
@WebServlet("/HouseholdAddCon")
public class HouseholdAddCon extends HttpServlet {
	 protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
	      System.out.println("[HouseholdAddCon]");
	      request.setCharacterEncoding("UTF-8");
	      

	      // 세션 생성 및 객체 재생성
	      HttpSession session = request.getSession();
	      MemberDTO info = (MemberDTO) session.getAttribute("info");

	      String FAMILY_KEY = info.getFAMILY_KEY();
	      String WORK = request.getParameter("WORK");
	      
	      
	      System.out.println("WORK: "+WORK);

	         
	      // DB
	      HouseholdDAO dao = new HouseholdDAO();
	      int row = dao.addHousehold(new HouseholdDTO(FAMILY_KEY, WORK));

	      
	      String result;
	      
	      if(info!=null){
	         result = "";
	         System.out.println("오라클 집안일 DB 연결 성공");
	         session.setAttribute("WORK", WORK);
	      }else{
	         result = "오라클 집안일 DB 연결 실패";
	         System.out.println("오라클 집안일 DB 연결 실패");
	      }

	      response.setCharacterEncoding("UTF-8");
	      response.getWriter().print(result);
	      
	      
	      
	   }


}
