package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemoDAO;
import com.smhrd.model.MemoDTO;

@WebServlet("/MemodeleteCon")
public class MemodeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 자바스크립트에서 전송한 데이터를 받아옵니다.
		System.out.println("메모 삭제하는 곳");
		String MemoManager = request.getParameter("manager");
		String MemoTitle = request.getParameter("title");
		String num = "1";
		System.out.println("MemoManager: " + MemoManager);
		System.out.println("MemoTitle: " + MemoTitle);
		
        HttpSession session = request.getSession();
	    String FAMILY_KEY = (String) session.getAttribute("FAMILY_KEY");
		System.out.println(FAMILY_KEY);
		String FK = FAMILY_KEY;

		int row = new MemoDAO().deleteMemo(new MemoDTO(num,FK,MemoManager,MemoTitle));
		 if(row>0) {
	    	  System.out.println("부부 브리핑 삭제 성공");
	      }else {
	    	  System.out.println("부부 브리핑 삭제 실패");	    	  
	      }
	
	}
}
