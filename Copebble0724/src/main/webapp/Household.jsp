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
    <!-- jquery 불러오기 -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    
    <!-- 부트스트랩 태그 및 무료 아이콘 태그 모으는 곳 -->
    <script src="https://kit.fontawesome.com/a34da1aa1b.js" crossorigin="anonymous"></script>
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
    <link rel="stylesheet" href="./css/main.css" />
    <link rel="stylesheet" href="./css/MyPage.css" />
    <link rel="stylesheet" href="./css/Household.css" />

</head>
<body>

   <!--헤더-->
   <header class="header_main mt-3 ">
		<div style="width: 300px;"></div>

		<div style="width: 5%; min-width: 150px;">
			<a href="Main.jsp"> <img class="header_logo" src="mainlogo.png"
				alt="">
			</a>
		</div>
		<div style="width: 20px;"></div>
		<div style="min-width: 140px;">
			<a href="DiaryMain.jsp" class="baby_diary">
				<p>육아 다이어리</p>
			</a>
		</div>

		<div style="min-width: 140px;">
			<a href="Household.jsp" class="baby_diary">
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
        <div class="TableTitleBox">
            <br>
            <h2 style="text-align: center; font-weight: bold;">가사일</h2>
            <hr>
            <br>
            <div class="button-container">
                <button id="btn" class="modal1" onclick="showImage1()">방</button>       
                <button id="btn" class="modal2" onclick="showImage2()">거 실</button>
                <button id="btn" class="modal3" onclick="showImage3()">주 방</button>
                <button id="btn" class="modal4" onclick="showImage4()">화장실</button>
                <button id="btn" class="modal5" onclick="showImage5()">식재료</button>
            </div>
       
            <div id="imageContainer">
                <!-- 이미지가 보여질 영역 -->
            </div>
            <div class="mypage_textbox"></div><!-- 공백 -->
        </div>

        <!-- 가사일 -->
        <div id="checkboxContainer">
            <div id="eventWhose">
                <!-- 내용 -->
                &nbsp;&nbsp;&nbsp;장소 <br>
                <input type="button" value="거실" onclick="insertValue(' 거실')">
                <input type="button" value="주방" onclick="insertValue(' 주방')">
                <input type="button" value="화장실" onclick="insertValue(' 화장실')">
                <input type="button" value="방" onclick="insertValue(' 방')">
                <input type="button" value="세탁기" onclick="insertValue(' 세탁기')">
                <br><br>
                &nbsp;&nbsp;&nbsp;하기 <br>
                <input type="button" value="청소기 밀기" onclick="insertValue(' 청소기 밀기 ')">
                <input type="button" value="빗자루질 하기" onclick="insertValue(' 빗자루질 하기 ')">
                <input type="button" value="청소하기" onclick="insertValue(' 청소하기 ')">
                <input type="button" value="걸레질 하기" onclick="insertValue(' 걸레질 하기 ')">
                <input type="button" value="환기하기" onclick="insertValue(' 환기하기 ')">
                <input type="button" value="빨래개서 넣기" onclick="insertValue(' 빨래개서 넣기 ')">
                <input type="button" value="설거지 하기" onclick="insertValue(' 설거지 하기 ')">
                <input type="button" value="분리수거 하기" onclick="insertValue(' 분리수거 하기 ')">
                <input type="button" value="음쓰버리기" onclick="insertValue(' 음쓰버리기 ')">
                <br><br>
                &nbsp;&nbsp;&nbsp;누가 <br>
                <input type="button" value="👩" onclick="insertValue(' 👩 ')">
                <input type="button" value="🧑" onclick="insertValue(' 🧑 ')">
                <br><br>     
            </div>

            <div id="addBox">
                <!-- 추가 버튼 -->
                <br>
                <h3>&nbsp;작성</h3>
                <input type="text" id="myInput" id="newItem">
                <button id="addDelete" onclick="addCheckbox()">추가</button><br>
                <!-- 추가된 체크박스 -->
                <input type="checkbox" name="defaultCheckbox" value="default">
                <label>어디의 어떤 일을 누가 할까요?</label>
                <button id="addDelete" onclick="this.parentElement.parentElement.removeChild(this.parentElement)">삭제</button>
            </div>
        </div>
    </main>
    
    <!-- 장소 별 모달창 -->
    <div class="modal modalBack" id="modal1">
        <span class="close-btn">&times;</span>
        
    </div>


     
   
    



    <!-- 외부 자바스크립트 연결 -->
   <script src="./js/Household.js"></script>
</body>
</html>