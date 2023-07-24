<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="./css/diary_write.css">
</head>

<body>
    <!-- 흰색 div -->
    <form action="DiaryWriteCon.do" method="post"
			enctype="multipart/form-data" id="DiaryForm">
    <div class="diary_write_top_div">
        <div class="diary_babyname_div">
            <p id="diary_babyname_p">따봉도치(1세)</p>
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
            <div id="diary_button">
            <input hidden type="text" name="FAMILY_KEY" value="패밀리키">
                <button id="diary_upload_btn">등록</button>
                <a href="main.html"><button id="diary_Main_btn">돌아가기</button></a>
            </div>
        </div>
    </div>
</body>
<script src="./js/diaryWrite.js"></script>

</html>