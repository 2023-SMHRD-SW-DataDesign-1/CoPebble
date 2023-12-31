<%@page import="com.smhrd.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- 부트스트랩 태그 및 무료 아이콘 태그 모으는 곳 -->
<script src="https://kit.fontawesome.com/a34da1aa1b.js"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css"
	rel="stylesheet">
<link rel="stylesheet" href="./css/main.css" />
<link rel="stylesheet" href="./css/MyPage.css" />
<link rel="stylesheet" href="./css/Household.css" />
<style>
* {
	font-family: 'NanumSquareAcb';
}
</style>
</head>
<body>

	<!--헤더-->

	<header class="header_main mt-3 ">
		<div style="width: 300px;"></div>

		<div style="width: 5%; min-width: 150px;">
			<a href="Main.jsp"> <img class="header_logo"
				src="./img/0729logomain-01.png" alt="">
			</a>
		</div>
		<div style="width: 20px;"></div>
		<div style="min-width: 140px;">
			<a href="DiaryMain.jsp" class="baby_diary">
				<p>육아 다이어리</p>
			</a>
		</div>

		<div style="min-width: 140px;">
			<a href="DiaryMain.jsp" class="baby_diary">
				<p>집안일 관리</p>
			</a>
		</div>

		<div style="width: 40%;"></div>

		<div style="width: 70px;">
			<a href="MyPage.jsp" class="header_icon_mypage"> <i
				class="fa-solid fa-gear" style="font-size: 30px; color: #000000;"></i>
			</a>
		</div>
		<div style="width: 70px;">

			<a href="LogoutCon" class="header_icon_logout"> <i
				class="fa-solid fa-right-from-bracket"
				style="font-size: 30px; color: #000000;"></i>
			</a>
		</div>
	</header>


	<!-- 메인 -->
	<main class="fullmain">
		<!-- 배경 이미지 태그-이게 전체 배경이 될 예정 -->

		<img src="./img/household.png" class="householdimage"> <br>
		<!-- 이거는 그 배경안에 내용물들을 하나로 묶어서 배경 안에 묶일 컨텐트 박스-->
		<div class="todocontent">

			<div style="height: 2%;"></div>
			<div id="addBox">

				<br>
				<h5>새로 해야할 일이 있나요?</h5>
				<input type="text" id="myInput" id="newItem"
					placeholder="   해야할 집안일을 적어주세요">
				<button id="add_btn">추가</button>
				<br>
				<h5>해야할 일들</h5>
				<div id="household_list"></div>
				<!-- 저장된 집안일 보여주는 곳 -->
			</div>
		</div>

		<!-- 가사일 -->
		<div id="checkboxContainer">
			<div id="eventWhose">
				<!-- 내용 -->
				<span class="where" style="background-color: #b1e9ff73;">🏠집안일
					구역 선택</span> <br> <input type="button" value="거실"> <input
					type="button" value="주방"> <input type="button" value="화장실">
				<input type="button" value="방"> <input type="button"
					value="세탁기"> <input type="button" value="베란다"> <br>

				<br> <span class=whattodo style="background-color: #fff7076b;">🔎집안일
					선택</span><br> <input type="button" value="청소기 밀기"><input
					type="button" value="빗자루질 하기"> <input type="button"
					value="청소하기"> <input type="button" value="걸레질 하기">
				<input type="button" value="환기하기"> <input type="button"
					value="빨래개서 넣기"> <input type="button" value="설거지 하기">
				<input type="button" value="분리수거 하기"> <input type="button"
					value="음쓰버리기"> <br> <br> <span class="who"
					style="background-color: #00ff1414;">✔담당자 선택</span> <br> <input
					type="button" value="👩"> <input type="button" value="🧑">
				<br> <br> <span class="chooseline"
					style="background-color: #ff5e0029;">📏구분선 선택</span> <br> <input
					type="button" value="_"> <input
					type="button" value="/"> <br>
				<br> <span class="whenwedo"
					style="background-color: #e7b9ff52;">📆마감 기한 선택</span><br> <input
					type="button" value="월"> <input
					type="button" value="일"> <input
					type="button" value="오전"> <input
					type="button" value="오후"> <input
					type="button" value="1"> <input type="button" value="2">
				<input type="button" value="3"> <input type="button"
					value="시"> <input type="button" value="4"> <input
					type="button" value="5"> <input type="button" value="6">
				<input type="button" value="분"> <input type="button"
					value="7"> <input type="button" value="8"> <input
					type="button" value="9"> <input type="button" value="0">
				<br> <br>
			</div>


		</div>

	</main>


	<!-- 외부 자바스크립트 연결 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="./js/Household.js"></script>
</body>
</html>