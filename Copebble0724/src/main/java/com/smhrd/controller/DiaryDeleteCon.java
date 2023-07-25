package com.smhrd.controller;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.command.Command;
import com.smhrd.model.DiaryDAO;
import com.smhrd.model.DiaryDTO;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DiaryDeleteCon")
public class DiaryDeleteCon extends HttpServlet implements Command {
	
    public String execute(HttpServletRequest request, HttpServletResponse response)  { 
         System.out.println("[DiaryDeleteCon]");

 		//MultipartRequest변수 설정
 		// 1. request 객체
 		// 2. savePath(저장경로)
 		String savePath = request.getServletContext().getRealPath("img");
 		System.out.println(savePath);
 		
 		// 3. maxSize
 		int maxSize = 10*1024*1024;
 		
 		// 4. encoding
 		String encoding = "UTF-8";
 		
 		// 5. 중복제거
 		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
 		
 		MultipartRequest multi = null;
 		try {
 			multi = new MultipartRequest(request, savePath, maxSize, encoding, rename);
 		} catch (IOException e) {
 			e.printStackTrace();
 		}
	
 		String NUM2 = multi.getParameter("num");		
 		
 		int NUM = Integer.parseInt(NUM2);
        
         int row = new DiaryDAO().deleteDiary(NUM);
 		
 	    // 성공실패
 	      if(row>0) {
 	    	  System.out.println("삭제 성공");
 	      }else {
 	    	  System.out.println("삭제 실패");	    	  
 	      }
 		return "DiaryMain.jsp";
    }

	

}
