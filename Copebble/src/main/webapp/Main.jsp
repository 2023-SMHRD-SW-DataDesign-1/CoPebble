<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.DiaryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String id = (String)session.getAttribute("ID");%>
<h1>메인페이지입니다.</h1>
${ID}
 
</body>
</html>