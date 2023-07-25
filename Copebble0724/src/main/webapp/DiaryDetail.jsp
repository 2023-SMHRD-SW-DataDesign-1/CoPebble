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
    <link rel="stylesheet" href="./css/diary_detail.css">
      <style>
        @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

        * {
            font-family: "Noto Sans KR", sans-serif;
        }
    </style>
</head>

<body>
   <!--헤더-->

    <header class="header_main mt-3 ">
        <div style="width: 20%;">
        </div>

        <div style="width: 10%; min-width: 150px;">
            <a href="main.html">
                <img class="header_logo" src="./img/mainLogo.png" alt="">
            </a>


        </div>

        <div style="width: 45%; min-width: 100px;">
            <a href="DiaryMain.jsp" class="baby_diary">
                <p1>육아 다이어리</p1>
            </a>
        </div>

        <div style="width: 2%; min-width: 20px;">
            <a href="mypage.html" class="header_icon_mypage">
                <i class="fa-solid fa-gear" style="font-size: 30px; color: #000000;"></i>
            </a>
        </div>
        <div style="width: 2%; min-width: 20px;">

            <a href="#" class="header_icon_logout">
                <i class="fa-solid fa-right-from-bracket" style="font-size: 30px; color: #000000;"></i>
            </a>
        </div>
        <div style="width: 21%;">
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
        <div class="diary_write_title_div">${Diary.TITLE}</div>
        <div>
            <div class="diary_picture_div">
                <div id="image_preview_div">
                    <img id="image_preview" alt="미리보기 이미지" src="./img/${Diary.FILENAME}">
                    <button id ="download_btn"><a href="./img/${Diary.FILENAME}" download> 다운로드</a></button>
                    <p></p>
                </div>
            </div>
            <div class="diary_write_memo_div">
                ${Diary.DIARY}</textarea>
            </div>
            <div id="diary_button">
                <button id="diary_goUpdate_btn" onclick="goToUpdate('${param.num}')">수정하기</button>
                <a href="./DiaryMain.jsp"><button id="diary_Main_btn">뒤로가기</button></a>
            </div>
          
        </div>
    </div>
</body>
<script src="./js/diaryWrite.js"></script>
<script type="text/javascript">

function goToUpdate(index) {
	location.href = 'DiaryUpdate.jsp?num='+index
}
</script>


</html>