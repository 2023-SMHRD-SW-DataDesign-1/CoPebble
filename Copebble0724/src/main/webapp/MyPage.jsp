<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@page import="com.smhrd.model.MemberDTO"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<!-- jquery 불러오기 -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
   integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
   crossorigin="anonymous"></script>
<!-- 부트스트랩 태그 및 무료 아이콘 태그 모으는 곳 -->
<script src="https://kit.fontawesome.com/a34da1aa1b.js"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
   crossorigin="anonymous"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
   crossorigin="anonymous">
<!-- 외부 CSS -->
<link
   href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css"
   rel="stylesheet">
<link rel="stylesheet" href="./css/main.css" />
<link rel="stylesheet" href="./css/MyPage.css" />
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
         <a href="Main.jsp"> <img class="header_logo"
            src="./img/0729logomain-01.png" alt="">
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


   <!--메인-->
   <main class="fullmain">
      <div class="mypage_textcontent">
         <div class="TableTitleBox">
            <br>
            <h2 style="text-align: center; font-weight: bold;">회원정보 수정</h2>
            <hr>
            <%
            MemberDTO info = (MemberDTO) session.getAttribute("info");
            %>
            <div>
               <p style="margin-bottom: 1%; font-size: 20px;">이름</p>
               <c:when test="${info!=null}">
                  <p><%=info.getNAME()%></p>
                  <p style="margin-bottom: 1%; font-size: 20px;">아이디</p>
                  <p><%=info.getID()%></p>
                  <a href="FamilyKey.jsp" class="goFamilykey">
                     <p style="margin-bottom: 1%; font-size: 20px;">패밀리키</p>
                  </a>
                  <p><%=info.getFAMILY_KEY()%></p>
               </c:when>
               <input type="hidden" name="ID" id="ID" value="${info.ID}">
               <p style="margin-bottom: 1%; font-size: 20px;">비밀번호 변경</p>
               <input type="password" name="PW" id="PW"
                  placeholder="  변경할 비밀번호 입력">
               <p style="margin-bottom: 1%; font-size: 20px;">비밀번호 변경 확인</p>
               <input type="password" name="CheckPw" id="inputPasswordCheck"
                  style="margin-bottom: 50px;" placeholder="  변경할 비밀번호 확인">
               <br>
               <div style="display: flex; justify-content: center;">
                  <input type="submit" value="비밀번호 변경" class="pwChange"
                     id="passwordChange">
                  <!-- ajax로 정보 변경하기 -->
               </div>
               <br>
               <div style="display: flex; justify-content: center;">
                  <input type="button" class="pwChange" id="deleteMemberModal_btn"
                     value="회 원 삭 제">
               </div>
            </div>
         </div>
      </div>
   </main>
   </container>

   <!-- 회원정보 삭제 재확인 모달창 -->
   <div id="modal4" class="modalBack">
      <div class="modal-content">
         <span class="close-btn">&times;</span>
         <div class="headerLogo style="width: 200px;
    margin-left: 18%;
"></div>
         <br>
         <h3 style="text-align: center;">
            WithDAY를<br>탈퇴하시겠습니까?
         </h3>
         <br>
         <div style="display: flex; justify-content: center;">
            <a href="DeleteMemberCon?ID=${info.ID}" id="deleteMember"
               class="deleteMember_btn">회 원 삭 제</a>
         </div>
      </div>
   </div>

   <!-- 회원정보변경(비밀번호변경) 완료 모달창 -->
   <div id="mypage_password_popup" class="modalBack">
      <div class="modal-content">
         <span class="close-btn" id="goMain2">&times;</span>
         <div class="headerLogo"></div>
         <br>
         <br>
         <h2 style="text-align: center;">비밀번호가</h2>
         <h3 style="text-align: center;">변경되었습니다.</h3>
      </div>
   </div>


   <!-- 외부 자바스크립트 연결 -->
   <script src="./js/MyPage.js"></script>

   <!-- 회원정보변경(비밀번호변경) ajax -->
   <script>
      $(document)
            .ready(
                  function() {
                     $("#passwordChange")
                           .on(
                                 'click',
                                 function() {
                                    var ID = $("#ID").val();
                                    var PW = $("#PW").val();
                                    console.log(ID);
                                    console.log(PW);

                                    $
                                          .ajax({
                                             url : "UpdateCon",
                                             dataType : "text",
                                             data : {
                                                ID : ID,
                                                PW : PW
                                             }, //여기까지 통신하고 UpdateCon으로 이동
                                             success : function(
                                                   response) {
                                                console
                                                      .log(response)
                                                if (response == "오라클 회원정보 수정 성공") {
                                                   alert("회원정보 수정 실패")
                                                } else {
                                                   // 변경 성공 시 모달창
                                                   document
                                                         .getElementById("mypage_password_popup").style.display = "block";
                                                }
                                             },
                                             error : function(e) {
                                                alert('회원정보 변경 통신실패');
                                             }
                                          });
                                 });
                  });
   </script>

   <script>
      var password = document.getElementById("PW");
      var confirmPassword = document.getElementById("inputPasswordCheck");

      function validatePassword() {
         if (password.value !== confirmPassword.value) {
            confirmPassword.setCustomValidity("비밀번호가 일치하지 않습니다");
         } else {
            confirmPassword.setCustomValidity('');
         }
      }
      password.onchange = validatePassword;
      confirmPassword.onkeyup = validatePassword;
   </script>

</body>

</html>