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
<style type="text/css">
#img{
width: 200px;
height: 200px;
}
</style>
</head>
<body>

<c:set var="DIARY_list" value="${DiaryDAO.showDiary()}"></c:set>
	<div id="DIARY">
		<table id="DIARY_list" border="1">
			<c:forEach items="${DIARY_list}" var="DIARY" varStatus="status">
			<div>
			<tr>
				<td colspan="2">${DIARY.ALLDATE.substring(0,10)}</td>
			</tr>
				<td><a href="DiaryDetail.jsp?num=${DIARY.NUM}">${DIARY.TITLE}</a></td>
			<tr id = "img">
				<td><img src="./img/${DIARY.FILENAME}" width="200px" height="200px"></td>
				<td>${DIARY.DIARY}</td>
			</tr>  
			<tr>
			<td><a href="DiaryDeleteCon.do?num=${DIARY.NUM}">삭제</a> </td>
			</tr>					
			</div>
			</c:forEach>
		</table>
	</div>
	
	

</body>
</html>