<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.DiaryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/diary_write2.css">
</head>

<body>
    <!-- 흰색 div -->
    <div class="diary_write_top_div">
        이름<div class="diary_babyname_div"></div>
        <div class="diary_br_div"></div>
        날짜<div class="diary_write_day_div"></div>
        제목<div class="diary_write_title_div"></div>
        사진<div class="diary_write_pick_div">
            <img alt="사진이미지" src="./img/로고최종3-01.png">
        </div>
        <button id="diary_pick_btn">사진추가</button>
        내용<div class="diary_write_memo_div"></div>
        <button id="diary_upload_btn">등록</button>
        <button id="diary_write_back_btn">돌아가기</button>
    </div>
</body>

</html>