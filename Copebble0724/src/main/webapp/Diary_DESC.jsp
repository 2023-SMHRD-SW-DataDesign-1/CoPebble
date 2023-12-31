<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.DiaryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="./css/diary_main.css">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="css/main_style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css"
	rel="stylesheet">
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
			<a href="Main.jsp"> <img class="header_logo" src="./img/0729logomain-01.png"
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
	<p></p>
	<%
	String FAMILY_KEY = (String) session.getAttribute("FAMILY_KEY");
	%>
	<c:set var="DIARY_list" value="${DiaryDAO.showDiary_DESC(FAMILY_KEY)}"></c:set>
	<div class="diary_top_div">

		<!-- 상단바 -->
		<div class="diary_header">
			<img src="./img/포대기아기.png" alt="포대기 아기 사진">
			<div class="diary_baby_div">육아 다이어리</div>
			<div class="diary_icon_div">
				<div>
					<span>최신순 </span><i class="fa-solid fa-caret-down" onclick="ASC()"></i>
				</div>
				<div class="plus_icon_div" onclick="goToWrite()">
					<img id="diaryPlus" alt="다이어리추가" src="./img/diaryplus.png">
				</div>
			</div>
		</div>

		<!-- 아래 큰 div -->
		<div class="diary_main_div">
			<div class="diary_name_div">BABY DIARY</div>
			<div class="diary_card_container">

				<c:set var="prevDate" value="" />

				<c:forEach items="${DIARY_list}" var="DIARY" varStatus="status">
					<div class="diary_card">
						<c:if test="${DIARY.ALLDATE.substring(0, 10) ne prevDate}">
							<div class="diary_date_div">${DIARY.ALLDATE.substring(0, 10)}</div>
							<c:set var="prevDate" value="${DIARY.ALLDATE.substring(0, 10)}" />
						</c:if>

						<div class="diary_card_item_div"
							onclick="goToDetail('${DIARY.NUM}')"
							ondblclick="showDeleteModal(this)">
							<img src="./img/${DIARY.FILENAME}" alt="아이이미지">
							<div class="diary_card_detail_div">
								<div class="diary_card_detail_title_div">${DIARY.TITLE}</div>
								<div>
                        <c:choose>
                            <c:when test="${fn:length(DIARY.DIARY) > 104}">
                                ${fn:substring(DIARY.DIARY, 0, 104)}.....더보기
                            </c:when>
                            <c:otherwise>
                                ${DIARY.DIARY}
                            </c:otherwise>
                        </c:choose>
                    </div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- Pagination navigation -->
			<div class="pagination">
				<i class="fa-solid fa-circle-chevron-left fa-2x"
					onclick="prevPage()"></i> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				<i class="fa-solid fa-circle-chevron-right fa-2x"
					onclick="nextPage()"></i>
			</div>
		</div>

	</div>


	<script>
    // JavaScript code for pagination
    const diaryCards = document.querySelectorAll('.diary_card');
    const itemsPerPage = 5;
    let currentPage = 0;

    function showPage(page) {
        const startIndex = page * itemsPerPage;
        const endIndex = startIndex + itemsPerPage;

        diaryCards.forEach((card, index) => {
            if (index >= startIndex && index < endIndex) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
            }
        });
    }

    function nextPage() {
        currentPage++;
        showPage(currentPage);
    }

    function prevPage() {
        currentPage--;
        if (currentPage < 0) {
            currentPage = 0;
        }
        showPage(currentPage);
    }

    // Show the first page on initial load
    showPage(currentPage);
</script>
	<script>

		function goToDetail(index) {
			console.log(index)
			location.href = 'DiaryDetail.jsp?num='+index
		}
		
		function goToWrite(){
			location.href = 'DiaryWrite.jsp'
		}
		
		function ASC(){
			location.href = 'DiaryMain.jsp'
		}

		
		

	</script>

	</script>
</body>
</html>