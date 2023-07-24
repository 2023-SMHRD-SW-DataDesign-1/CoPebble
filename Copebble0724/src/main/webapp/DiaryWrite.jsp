<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/diary_write.css">
</head>

<body>
   <!--헤더-->

    <header class="header_main mt-3 ">
        <div style="width: 20%;">
        </div>

        <div style="width: 10%; min-width: 150px;">
            <a href="main.html">
                <img class="header_logo" src="./img/logo-01.png" alt="">
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
    <form action="DiaryWriteCon.do" method="post"
			enctype="multipart/form-data" id="DiaryForm">
	<p>
    <div class="diary_write_top_div">
        <div class="diary_babyname_div">
            <p id="diary_babyname_p">김민국(만9세)</p>
        </div>
        <div class="diary_br_div"></div>
        <div class="diary_write_date_div">
            <p id="diary_write_date_p"></p>
        </div>
        <div class="diary_write_title_div"><input type="text" name="TITLE" placeholder="제목을 입력해주세요"></div>
        <div>
            <div class="diary_picture_div">
                <div id="image_preview_div">
                    <img id="image_preview" alt="미리보기 이미지" src="./img/사진아이콘.png">
                    <p></p>
                </div>
            </div>
            <input type="file" name="FILENAME" id="file_input">
            <div class="diary_write_memo_div">
                <textarea name="DIARY" cols="60" rows="12" style="resize: none;"></textarea>
            </div>
            <input hidden type="text" name="FAMILY_KEY" value="패밀리키">
            <div id="diary_button">
                <button id="diary_upload_btn">등록</button>
                <button id="diary_Main_btn" onclick="goToBack()">돌아가기</button>
            </div>
        </div>
    </div>
</body>
<script src="./js/diaryWrite.js"></script>
<script type="text/javascript">
function goToBack(){
	location.href = './DiaryMain.jsp'
}
</script>

</html>