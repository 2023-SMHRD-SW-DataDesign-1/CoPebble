package com.smhrd.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import com.smhrd.command.Command;
import com.smhrd.model.KakaoDAO;
import com.smhrd.model.KakaoDTO;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberDTO;

@WebServlet("/KakaoLoginCon")
public class KakaoLoginCon implements Command {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("[KakaoLoginCon]");
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		String NAME = request.getParameter("NAME");
		String ID = request.getParameter("ID");
		String accesstoken = request.getParameter("accesstoken");

		System.out.println(NAME);
		System.out.println(ID);
		System.out.println(accesstoken);

		
		
		
		String user_id = new KakaoDAO().KakaoLoginCheck(new KakaoDTO(ID,NAME));
		int row = 0;
		if(user_id == null) {
			row = new KakaoDAO().KakaoLogin(new KakaoDTO(ID,NAME));
		}else {
			HttpSession session =  request.getSession();
			session.setAttribute("ID",ID);
			session.setAttribute("NAME",NAME);
			session.setAttribute("accesstoken",accesstoken);
		}
		
		
		
		// 성공실패
		if (row > 0) {
			System.out.println("카카오 회원가입");
		}else if(user_id != null){
			System.out.println("카카오 로그인");
		}else if(row == 0) {
			System.out.println("로그인 실패");
		}
		
		String PW = "카카오로그인회원입니다.";
		 MemberDAO dao = new MemberDAO();
	      MemberDTO info = dao.login(new MemberDTO(ID, PW));
	      
	      String result;
	      if (info != null) {
	         result = "";
	          System.out.println("오라클 로그인 연결 성공");
	          // session객체 생성
	          HttpSession session = request.getSession();
	          session.setAttribute("info", info);
	      } else {
	         result = "오라클 로그인 연결 실패";
	          System.out.println("오라클 로그인 연결 실패");
	      }
	         
	      response.setCharacterEncoding("UTF-8");
	      try {
			response.getWriter().print(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}   

		return "./Main.jsp";

	}
}
