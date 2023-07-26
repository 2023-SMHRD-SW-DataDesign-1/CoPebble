<%@page import="com.smhrd.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="./css/familykey.css" />
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<!-- 부트스트랩 태그 및 무료 아이콘 태그 모으는 곳 -->
<script src="https://kit.fontawesome.com/a34da1aa1b.js"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   crossorigin="anonymous">
   
</script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
   crossorigin="anonymous"></script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

* {
   font-family: "Noto Sans KR", sans-serif;
}
</style>

</head>

<body>

   <c:set var="info" value="${sessionScope.info}" />
   <%
   MemberDTO info = (MemberDTO) session.getAttribute("info");
   %>



   <!-- 헤더 -->
   <header class="header_main mt-3 ">
      <div style="width: 20%;"></div>

      <div style="width: 10%; min-width: 150px;">
         <a href="main.html"> <img class="header_logo"
            src="/img/로고최종3-01.png" alt="">
         </a>

      </div>





      <!--육아다이어리  메인 -->
      <div style="width: 45%; min-width: 100px;">
         <a href="babydiary.html" class="baby_diary"> </a>
      </div>

      <div style="width: 2%; min-width: 20px;">
         <a href="mypage.html" class="header_icon_mypage"> <i
            class="fa-solid fa-gear" style="font-size: 30px; color: #000000;"></i>
         </a>
      </div>

      <div style="width: 2%; min-width: 20px;">
         <a href="#" class="header_icon_logout"> <i
            class="fa-solid fa-right-from-bracket"
            style="font-size: 30px; color: #000000;"></i>
         </a>
      </div>


   </header>



   <!--메인-->

   <main class="fullmain">
      <div class="familykey_box" style="width: 100%; min-width: 100px;">

         <div>
            <h2 class="familkey_title">${info.NAME}님패밀리키생성</h2>
            <hr>
            <div class="form-group" id="familykeycontent">
               <label for="inputPasswordCheck">패밀리키 생성</label>
               <div>
                  <button type="submit" id="familykey_make" class="btn btn-success">
                     패밀리키 생성</button>
                  <div class=familykey_make></div>
               </div>
               <div class="makespace">
                  <label for="inputPassword">패밀리키 입력</label>
               </div>
               <form action="FamilyKeyCon" method="POST">
                  <input type="text" class="form-control" id="FAMILY_KEY2" name="FAMILY_KEY"
                     placeholder="패밀리키를 등록해주세요">

                  <button type="submit" id="familykey_submit"
                     class="btn btn-success">
                     패밀리키 등록<i class="fa fa-check spaceLeft"></i>
                  </button>
               </form>
            </div>


         </div>


      </div>
   </main>





   </container>
   <script>
      document
            .getElementById('familykey_make')
            .addEventListener(
                  'click',
                  function() {
                     const randomString = generateRandomString(10); // 10자리 랜덤 문자열 생성
                     document.querySelector('.familykey_make').textContent = randomString;
                  });

      function generateRandomString(length) {
         const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
         let result = '';
         for (let i = 0; i < length; i++) {
            result += characters.charAt(Math.floor(Math.random()
                  * characters.length));
         }
         return result;
      }
   </script>






   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
   <script src="./js/familykey.js"></script>
</body>

</html>