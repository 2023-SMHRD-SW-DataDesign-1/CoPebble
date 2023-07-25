<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.DiaryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/diary_main.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
            <a href="Main.jsp">
                <img class="header_logo" src="mainlogo.png" alt="">
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
    <p></p>
    <c:set var="DIARY_list" value="${DiaryDAO.showDiary()}"></c:set>
    <div class="diary_top_div">

        <!-- 상단바 -->
        <div class="diary_header">
        	<img src="./img/baby.png" alt="포대기 아기 사진">
            <div class="diary_baby_div">육아 다이어리</div>
            <div class="diary_icon_div">
                <div>
                    <i class="fa-solid fa-magnifying-glass"></i>
                </div>
                <div class="plus_icon_div" onclick="goToWrite()">
                    <i class="fa-solid fa-plus"></i>
                </div>
            </div>
        </div>

<!-- 아래 큰 div -->
<div class="diary_main_div">
    <div class="diary_name_div">김민국(만9세)</div>
    <div class="diary_card_container" ">

        <c:set var="prevDate" value="" />  <%-- Initialize a variable to keep track of the previous date --%>

        <c:forEach items="${DIARY_list}" var="DIARY" varStatus="status">
        <div class="diary_card">
            <c:if test="${DIARY.ALLDATE.substring(0, 10) ne prevDate}">
                
                    <div class="diary_date_div">${DIARY.ALLDATE.substring(0, 10)}</div>
                
                <c:set var="prevDate" value="${DIARY.ALLDATE.substring(0, 10)}" />  <%-- Update the previous date value --%>
            </c:if>

            <div class="diary_card_item_div " onclick="goToDetail('${DIARY.NUM}')" ondblclick="showDeleteModal(this)">
                <img src="./img/${DIARY.FILENAME}" alt="아이이미지">
                <div class="diary_card_detail_div">
                    <div class="diary_card_detail_title_div">${DIARY.TITLE}</div>
                    <div>${DIARY.DIARY}</div>
                </div>
            </div>
            </div>
        </c:forEach>

    </div>
</div>


    </div>
    <!-- 다이어리 삭제를 물어보는 모달창 -->
    <div id="deleteModal" style="display: none;">
    <p>해당 다이어리를 삭제하시겠습니까?</p>
    <button onclick="deleteDiary()">삭제</button>
    <button onclick="closeDeleteModal()">취소</button>
</div>

<form id="deleteForm" method="post" action="/delete-diary">
    <input type="hidden" name="diaryId" id="diaryIdInput">
</form>

	<script>

		function goToDetail(index) {
			console.log(index)
			location.href = 'DiaryDetail.jsp?num='+index
		}
		
		function goToWrite(){
			location.href = 'DiaryWrite.jsp'
		}

	</script>
	
	<!-- 모달창 관련 js -->
	<script>
    function showDeleteModal(diary_card_item_div) {
        // 모달창 보이기
        const modal = document.getElementById("deleteModal");
        modal.style.display = "block";

        // 선택한 다이어리 카드 정보를 모달창에 저장 (다이어리 ID)
        const diaryId = diaryCardContainer.getAttribute("data-diary-id");
        const diaryIdInput = document.getElementById("diaryIdInput");
        diaryIdInput.value = diaryId;
    }

    function closeDeleteModal() {
        // 모달창 닫기
        const modal = document.getElementById("deleteModal");
        modal.style.display = "none";
    }

    function deleteDiary() {
        // 모달창에서 form을 제출
        const deleteForm = document.getElementById("deleteForm");
        deleteForm.submit();

        // 모달창 닫기
        closeDeleteModal();
    }
</script>


</body>
</html>