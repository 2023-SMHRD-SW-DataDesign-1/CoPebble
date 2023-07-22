package com.smhrd.controller;

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

		System.out.println(NAME);
		System.out.println(ID);

		
		
		
		String user_id = new KakaoDAO().KakaoLoginCheck(new KakaoDTO(ID,NAME));
		int row = 0;
		if(user_id == null) {
			row = new KakaoDAO().KakaoLogin(new KakaoDTO(ID,NAME));
		}else {
			HttpSession session =  request.getSession();
			session.setAttribute("ID",ID);
			session.setAttribute("NAME",NAME);
		}
		
		
		
		// 성공실패
		if (row > 0) {
			System.out.println("카카오 회원가입");
		}else if(user_id != null){
			System.out.println("카카오 로그인");
		}else if(row == 0) {
			System.out.println("로그인 실패");
		}

		return "./Main.jsp";

	}
}
