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
<link rel="stylesheet" href="./css/main.css" />
<link rel="stylesheet" href="css/main_style.css">
</head>

<body>
	<!-- 세션에 저장된 info불러오기 -->
	<c:set var="info" value="${sessionScope.info}" />
	<!--헤더-->

	<header class="header_main mt-3 ">
		<div style="width: 20%;"></div>

		<div style="width: 10%; min-width: 150px;">
			<a href="Main.jsp"> <img class="header_logo" src="./img/header_logo.png"
				alt="">
			</a>
		</div>

		<div style="width: 45%; min-width: 100px;">
			<a href="DiaryMain.jsp" class="baby_diary">
				<p>육아 다이어리</p>
			</a>
		</div>

		<div style="width: 3%; min-width: 20px;">
			<a href="MyPage.jsp" class="header_icon_mypage"> <i
				class="fa-solid fa-gear" style="font-size: 30px; color: #000000;"></i>
			</a>
		</div>
		<div style="width: 3%; min-width: 20px;">

			<a href="LogoutCon" class="header_icon_logout"> <i
				class="fa-solid fa-right-from-bracket"
				style="font-size: 30px; color: #000000;"></i>
			</a>
		</div>
		<div style="width: 21%;"></div>
	</header>


	<!--메인 박스 라인-->

	<div class="container mt-3" style="margin: 0 auto;">
		<div class="row">
			<div class="col-12">
				<!-- 안녕하세요 박스 전체 div -->
				<div class="hello_what_box" id="myBox">
					<!-- 철수님 은아님 안녕하세요 동그란 영역 -->
					<!-- 철수님 은아님 안녕하세요 텍스트 -->
					<div>
						<span class="hello_name" style="width: 100%; max-width: 500px;">
							${info.NAME}님 안녕하세요(●'◡'●)🧡🧡🧡🧡</span> <span id="current_date3"
							class="current_date4" style="width: 100%; max-width: 200px;"></span>
					</div>
				</div>

			</div>
			<!-- row속성으로 12칸 지정 -->
			<div class="row">
				<!-- 캘린더 -->
				<div class="col-xl-8 col-12 mt-3">
					<div class="calendar_box p-3">
						<br>
						<div id="calendar"></div>
					</div>
				</div>

				<!-- 가족 알림장 -->
				<div class="col-xl-4 col-12">

					<div class="familynotice mt-3 mb-3 p-3">
						<button class="familynotice_add">
							<i class="fa-regular fa-square-plus"
								style="font-size: 33px; color: #DC6721;"></i>
						</button>
						<div class="text-center">
							<a id="current_date"></a> 가족알림장
						</div>
						<hr>
						<div class="todoList"></div>
					</div>

					<div class="briefing p-2">
						<button class="briefing_add">
							<i class="fa-regular fa-square-plus"
								style="font-size: 33px; color: #DC6721;"></i>
						</button>
						<div class="text-center">부부 브리핑</div>
						<hr>
						<div id="MemoList"></div>
					</div>
					
					
				</div>
			</div>
		</div>
	</div>
	<!-- 여기부터는 팝업창 디자인 -->

	<div id="addEventPopup" class="custom-popup" style="display: none;">
		<h2>일정 추가</h2>
		<div class="form-group">
			<label for="eventTitle">일정 제목</label> <input type="text"
				id="eventTitle" placeholder="일정 제목을 입력하세요">
		</div>
		<div class="form-group">
			<label for="eventStart">시작일</label> <input type="text"
				id="eventStart" placeholder="YYYY-MM-DD 형식으로 입력하세요">
		</div>
		<div class="form-group">
			<label for="eventEnd">종료일</label> <input type="text" id="eventEnd"
				placeholder="YYYY-MM-DD 형식으로 입력하세요">
		</div>
		<select id="eventColor">
			<option value="" disabled selected>색상 선택</option>
			<option value="#808080">회색</option>
			<option value="#00FF00">초록색</option>
			<option value="#50bcdf">하늘색</option>
			<option value="#FFC0CB">분홍색</option>
			<option value="#FFFF00">노란색</option>
		</select>
		<div class="btn-container">
			<button id="addEventBtn">일정 추가</button>
			<button id="cancelBtn">취소</button>
		</div>
	</div>




	<div id="deleteEventPopup" class="custom-popup" style="display: none;">
		<h2>일정 삭제</h2>
		<p>정말로 일정을 삭제하시겠습니까?</p>
		<div class="btn-container">
			<button id="confirmDeleteBtn">확인</button>
			<button id="cancelDeleteBtn">취소</button>
		</div>
	</div>

	<div id="addEventPopup2" class="custom-popup" style="display: none;">
		<h2>✏가족알림장✏</h2>
		<div class="form-group">
			<label for="eventTodoTitle">내용</label> <input type="text"
				id="eventTodoTitle" placeholder="내용을 입력하세요">
		</div>
		<div class="form-group">
			<label for="eventTodoStart">시작일</label> <input type="text"
				id="eventTodoStart" placeholder="MM-DD 형식으로 입력하세요">
		</div>
		<div class="form-group">
			<label for="eventTodoEnd">종료일</label> <input type="text"
				id="eventTodoEnd" placeholder="MM-DD 형식으로 입력하세요">
		</div>
		<div class="form-group">
			<label for="eventManager">담당자</label> <label><input
				type="radio" name="Manager" value="🧑">🧑</label> <label><input
				type="radio" name="Manager" value="👩">👩</label>
		</div>
		<div class="btn-container">
			<button id="addTodoBtn">일정 추가</button>
			<button id="cancelTodoBtn">취소</button>
		</div>
	</div>

	<div id="addEventPopup3" class="custom-popup" style="display: none;">
		<h2>부부브리핑</h2>
		<div class="form-group">
			<label for="eventMemoTitle">내용</label> <input type="text"
				id="eventMemo" placeholder="내용을 입력하세요">
		</div>
		<div class="form-group">
			<label for="eventManager">담당자</label> <label><input
				type="radio" name="memoManager" value="🧑">🧑</label><label><input
				type="radio" name="memoManager" value="👩">👩</label>
		</div>
		<div class="btn-container">
			<button id="addMemoBtn">등록</button>
			<button id="cancelMemoBtn">취소</button>
		</div>
	</div>


	<script>
		// JavaScript 코드 작성
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();

		// "current_date"라는 ID를 가진 요소의 내용으로 현재 날짜 설정
		document.getElementById("current_date3").innerHTML = year + "년 "
				+ month + "월 " + day + "일";
	</script>


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
	<script src="./js/main_script.js"></script>
	<script src="./js/main_script_br.js"></script>
	<script src="./js/main_script_fa.js"></script>
</body>