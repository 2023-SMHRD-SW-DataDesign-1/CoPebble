<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.smhrd.model.DiaryDAO"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="css/main_style.css">
<link rel="stylesheet" href="./css/diary_update.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<style>
 * {
            font-family: 'NanumSquareAcb';
        }

</style>
</head>

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
			<a href="#" class="baby_diary">
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

	<!-- 흰색 div -->
	<p></p>

	<c:set var="Diary" value="${DiaryDAO.showDiaryOne(param.num)}"></c:set>
	<div class="diary_write_top_div">
		<div class="diary_babyname_div">
			<p id="diary_babyname_p">김민국(만9세)</p>
		</div>
		<div class="diary_br_div"></div>
		<div class="diary_write_date_div">
			<p id="diary_write_date_p">${Diary.ALLDATE.substring(0, 10)}</p>
		</div>
		<div class="diary_write_title_div">
			<!-- 폼태그 시작 -->
			<form action="DiaryUpdateCon.do" method="post"
				enctype="multipart/form-data" id="DiaryUpdateForm">
				<input type="text" name="TITLE" value="${Diary.TITLE}">
		</div>
		<div>
			<div class="diary_picture_div">
				<div id="image_preview_div">
					<img id="image_preview" alt="미리보기 이미지"
						src="./img/${Diary.FILENAME}"> <input type="file"
						name="FILENAME" id="file_input">

					<p></p>
				</div>
			</div>
			<div class="diary_write_memo_div">
				<textarea name="DIARY" cols="60" rows="12" style="resize: none;">${Diary.DIARY}</textarea>
			</div>
			<div id="diary_button">
				<input hidden name="num" type="text" value="${param.num}">
				<input hidden name="FAMILY_KEY" type="text" value="패밀리키">
				<button id="diary_modify_btn">수정하기</button>
				</form>
				<a href="./DiaryMain.jsp"><button id="diary_Main_btn">뒤로가기</button></a>
			</div>

		</div>
	</div>

</body>
<script src="./js/diaryUpdate.js"></script>
<script>
	
</script>



</html>