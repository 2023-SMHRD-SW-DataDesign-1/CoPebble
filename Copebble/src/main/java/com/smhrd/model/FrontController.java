package com.smhrd.model;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.Command;
import com.smhrd.controller.DiaryWriteCon;
import com.smhrd.controller.KakaoLoginCon;

// Web모듈이 높은 버전 일 때
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	HashMap<String, Command> list = null;
	
	public void init(ServletConfig config) throws ServletException {
		// init메소드 : 서블릿 요청 시 최초 1번만 호출, 서블릿 초기화 작업
		// HashMap(해시맵) : Key, value형태로 데이터를 보관하는 구조
		list = new HashMap<String, Command>();
		list.put("DiaryWriteCon.do", new DiaryWriteCon());
		list.put("KakaoLoginCon.do", new KakaoLoginCon());

		
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// FrontController 역학
		// - 모든 요청을 FrontController에서 받아서 개발과 유지보수의 편의성을 극대화
		// 모든 요청을 받기위해 URL mapping 값을 *.do로 변경
		// 만약 Web모듈 버전이 낮다면? : webapp>WEB-INF>web.xml에 url mapping태그 변경
		// <servlet-mapping>
	  	//   <servlet-name>FrontController</servlet-name>
	  	//   <url-pattern>*.do</url-pattern>
	    // </servlet-mapping> 
		System.out.println("[FrontController]");
		
		// 2. 어떤 요청이 들어왔는지 확인
		String reqURI = request.getRequestURI();
		System.out.println(reqURI);
		
		String contextPath =  request.getContextPath();// ContextPath(서버가 프로젝트를 찾는이름)
		System.out.println(contextPath);
		
		// substring메소드 사용해서 요청 값만 출력
		String path = reqURI.substring(contextPath.length()+1);
		System.out.println(path);
		
		// 3. HashMap에 저장된 Class불러오기
		Command con =  list.get(path);
		String moveURL = con.execute(request, response);
		
		// 4. 페이지 이동
		if(moveURL.contains("forward")) {
		moveURL = moveURL.substring("forward".length());
		RequestDispatcher rd = request.getRequestDispatcher(moveURL);
		rd.forward(request, response);
		}else {
			response.sendRedirect(moveURL);			
		}
		
		
	}

}
