package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemoDAO;
import com.smhrd.model.MemoDTO;

@WebServlet("/MemoDataCon")
public class MemoDataCon extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 자바스크립트에서 전송한 데이터를 받아옵니다.
        String MemoManager = request.getParameter("manager");
        String MemoTitle = request.getParameter("title");
        String num = "1";
        // 받아온 데이터를 출력합니다.
        System.out.println("MemoManager: " + MemoManager);
        System.out.println("MemoTitle: " + MemoTitle);

        String FK = "test0001";


		int row = new MemoDAO().writeMemo(new MemoDTO(num,FK,MemoManager,MemoTitle));
		 if(row>0) {
	    	  System.out.println("부부 브리핑 저장 성공");
	      }else {
	    	  System.out.println("부부 브리핑 저장 실패");	    	  
	      }
		
		
        }
}
