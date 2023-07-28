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
<link rel="stylesheet" href="./css/diary_detail.css">
<script src="https://kit.fontawesome.com/a34da1aa1b.js"
   crossorigin="anonymous"></script>
   <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

* {
	font-family: "Noto Sans KR", sans-serif;
}
</style>
<style>

button {
	margin-right: 10px;
}
</style>
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
	<button id="diary_Main_btn"><a href="./DiaryMain.jsp">&times;</a></button>
		<div class="diary_babyname_div">
			<p id="diary_babyname_p">김민국(만9세)</p>
		</div>
		<div class="diary_br_div"></div>
		<div class="diary_write_date_div">
			<p id="diary_write_date_p">${Diary.ALLDATE.substring(0, 10)}</p>
		</div>
		<div class="diary_write_title_div">${Diary.TITLE}</div>
		<div>
			<div class="diary_picture_div">
				<div id="image_preview_div">
					<img id="image_preview" alt="미리보기 이미지"
						src="./img/${Diary.FILENAME}">
					<button id="download_btn">
						<a href="./img/${Diary.FILENAME}" download> 다운로드</a>
					</button>
					<p></p>
				</div>
			</div>
			<div class="diary_write_memo_div">
				${Diary.DIARY}
				</textarea>
			</div>
			<div id="diary_button">
				<button id="diary_goUpdate_btn" onclick="goToUpdate('${param.num}')">수정하기</button>
				<!-- 다이어리 삭제 폼 -->
				<button id="diary_modal_btn" type="button">삭제</button>
			</div>

		</div>
	</div>

	<!-- 삭제 확인 모달창 -->
	<div id="diary_modal">
    <div id="modal-content">
    	<div id="alert">
    	<i class="fa-solid fa-triangle-exclamation fa-2xl" style="color: #e22222; font-size: 55px;"></i>
    	</div>
        <h3>정말 해당 다이어리를 삭제하시겠습니까?</h3>
        <div>
            <form action="DiaryDeleteCon.do" method="post" enctype="multipart/form-data" id="DiaryDeleteForm">
                <input type="hidden" name="num" value="${param.num}">
                <button id="delete_btn">YES</button>
            </form>
            <button id="cancel_btn">NO</button>
        </div>
    </div>
</div>
	</div>
	
	
	
	
	
	<script src="./js/diaryDelete.js"></script>
</body>
</html>