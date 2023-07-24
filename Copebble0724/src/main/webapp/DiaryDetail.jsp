<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.smhrd.model.DiaryDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
        @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

        * {
            font-family: "Noto Sans KR", sans-serif;
        }
    </style>
</head>
<body>
	<!-- Q19. 게시글 세부내용 조회 기능 -->
	<c:set var="Diary" value="${DiaryDAO.showDiaryOne(param.num)}"></c:set>
	<div id="DiaryOne">
		<table id="DiaryOnelist">
			<tr>
				<td>제목</td>
				<td>${Diary.TITLE}</td>
			</tr>
			<tr>
				<td>다운로드</td>
				<td><a href="./img/${Diary.FILENAME}" download>다운로드</a></td>
			</tr>
			<tr>
				<td colspan="2">내용</td>
			</tr>
			<tr>
				<td colspan="2">
					<h3>${Diary.DIARY}</h3> <img alt="" src="./img/${Diary.FILENAME}">
					이미지
				</td>
			</tr>
			<tr>
				<td colspan="2"><a href="DiaryMain.jsp"><button>뒤로가기</button></a></td>
			</tr>
		</table>
	</div>
</body>
</html>