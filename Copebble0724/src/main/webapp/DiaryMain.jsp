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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
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
    <div class="diary_card_container">

        <c:set var="prevDate" value="" />  <%-- Initialize a variable to keep track of the previous date --%>

        <c:forEach items="${DIARY_list}" var="DIARY" varStatus="status">
        <div class="diary_card">
            <c:if test="${DIARY.ALLDATE.substring(0, 10) ne prevDate}">
                
                    <div class="diary_date_div">${DIARY.ALLDATE.substring(0, 10)}</div>
                
                <c:set var="prevDate" value="${DIARY.ALLDATE.substring(0, 10)}" />  <%-- Update the previous date value --%>
            </c:if>

            <div class="diary_card_item_div" onclick="goToDetail('${DIARY.NUM}')">
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

	<script>

		function goToDetail(index) {
			location.href = 'DiaryDetail.jsp?num='+index
		}
		
		function goToWrite(){
			location.href = 'DiaryWrite.jsp'
		}

	</script>


</body>
</html>