package com.smhrd.controller;

import com.smhrd.command.Command;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DiaryDeleteCon")
public class DiaryDeleteCon extends HttpServlet implements Command {
	
    public String execute(HttpServletRequest request, HttpServletResponse response)  { 
         System.out.println("[DiaryDeleteCon]");
			return null;
    }

	

}
