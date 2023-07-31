package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.model.HouseholdDAO;
import com.smhrd.model.HouseholdDTO;

/**
 * Servlet implementation class HouseholdShowCon
 */
@WebServlet("/HouseholdShowCon")
public class HouseholdShowCon extends HttpServlet {
	  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
	         System.out.println("[HouseholdShowCon]");
	         
	         HttpSession session = request.getSession();
	 		String FAMILY_KEY = (String) session.getAttribute("FAMILY_KEY");
	 		System.out.println(FAMILY_KEY);
	         
	         request.setCharacterEncoding("UTF-8");
	         
	        ArrayList<HouseholdDTO> household_List = HouseholdDAO.showHousehold(FAMILY_KEY);
	         String WORK = request.getParameter("WORK");
	       

	         System.out.println("WORK: " + WORK);
	         
	         response.setContentType("application/json");
	         response.setCharacterEncoding("UTF-8");
	         response.getWriter().print(new Gson().toJson(household_List));
	      
	      
	   }

}
