<%@page import="com.smhrd.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- <script src="https://code.jquery.com/jquery-3.7.0.slim.js" integrity="sha256-7GO+jepT9gJe9LB4XFf8snVOjX3iYNb0FHYr5LI1N5c=" crossorigin="anonymous"></script> -->
<!-- 부트스트랩 태그 및 무료 아이콘 태그 모으는 곳 -->
<script src="https://kit.fontawesome.com/a34da1aa1b.js"
   crossorigin="anonymous"></script>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
   crossorigin="anonymous">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" />
<link rel="stylesheet" href="./css/Main.css" />
<link rel="stylesheet" href="./css/IntroModal.css">

</head>

<body>
   <!--헤더-->
   <header class="header_main mt-3 ">
      <div style="width: 20%;"></div>
      <!--메인로고 -->
      <div style="width: 10%; min-width: 150px;">
         <a href="Main.jsp"> <img class="header_logo" src="mainlogo.png" alt="">
         </a>
      </div>
      <!-- 육아 다이어리 로고 -->
      <div style="width: 45%; min-width: 100px;">
         <a href="babydiary.html" class="baby_diary"> 
            <p1>육아 다이어리</p1>
         </a>
      </div>

      <!-- 로그인 로고 -->
      <div style="width: 2%; min-width: 70px;">
         <button id="loginModal_btn">로그인</button>
      </div>

      <!-- 회원가입 로고 -->
      <div style="width: 2%; min-width: 90px;">
         <button id="joinModal_btn">회원가입</button>
      </div>

      <div style="width: 21%;"></div>
   </header>


   <!--메인-->
   <main>
      <!-- 소개 이미지 또는 글 넣기 -->
      <div>
         <img src="mainlogo.png" class="leftSlide"> 
         <img src="mainlogo.png" class="rightSlide">
      </div>

      <!-- 로그인 모달창 -->
        <div id="modal1" class="modalBack">
            <div class="modal-content">
                <span class="close-btn">&times;</span>
                <div class="header_logo2"></div> <br>
                <p style="margin-bottom: 1%; font-weight: bold;">아이디</p>
                <input type="text" name="id" id="loginID" placeholder="  아이디를 입력하세요">
                <p style="margin-bottom: 1%; font-weight: bold;">비밀번호</p>
                <input type="password" name="pw" id="loginPW" placeholder="  비밀번호를 입력하세요">
        
                <input type="submit" value="로그인" id="login_btn">
                <input type="submit" value="카카오 로그인" id="kakao-login-btn">
                <hr class="hr">
                <input type="submit" value="회원가입" id="joinModal_btn2"> <!-- 회원가입 모달창 열기 -->
            </div>
        </div>

      <!-- 회원가입 모달창 -->
      <div id="modal2" class="modalBack">
         <div class="modal-content">
            <span class="close-btn">&times;</span>
            <div class="header_logo2"></div>
            <p style="margin-bottom: 1%; font-weight: bold;">아이디</p>
            <input type="text" name="ID" id="joinID" placeholder="  아이디를 입력하세요">
            <p style="margin-bottom: 1%; font-weight: bold;">비밀번호</p>
            <input type="password" name="PW" id="joinPW" placeholder="  비밀번호를 입력하세요">
            <p style="margin-bottom: 1%; font-weight: bold;">비밀번호 확인</p>
            <input id="pwCheck" type="text" name="pwCheck" placeholder="  비밀번호를 확인 해 주세요">
            <p style="margin-bottom: 1%; font-weight: bold;">이름</p>
            <input type="text" name="NAME" id="joinNAME" placeholder="  이름을 입력하세요">
            <input type="submit" value="회원가입" id="join_btn"> <!-- 회원가입 ajax -->
         </div>
      </div>

      <!-- 회원가입완료 모달창 -->
      <div id="modal3" class="modalBack">
         <div class="modal-content">
            <span class="close-btn">&times;</span>
            <div class="header_logo3"></div>
              <h1 id="join_name"></h1> <!------------------------------- ajax로 값 가져오기 -->
            <h1>withDAY의</h1><br>
            <h2>회원이 되셨습니다</h2>
            <a href="FamilyKey.jsp"> 
               <input type="submit" value="패밀리키 등록하기" id="goFamily">
            </a>
            <a href="Main.jsp"> 
               <input type="submit" value="withDAY 이용하기" id="goMain">
            </a> 
         </div>
      </div>
   </main>

   <!-- 외부 자바스크립트 연결 -->
   <script src="./js/IntroModal.js"></script>
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   <script type="text/javascript">
     Kakao.init('1a299c90361bc9c75bee41f6a9bc76e0'); // 사용하려는 앱의 JavaScript 키 입력
     
   $("#kakao-login-btn").on("click", function(){
    // 1. 로그인 시도
       Kakao.Auth.login({
       success: function(authObj) {
         
    // 2. 로그인 성공시, API 호출
       Kakao.API.request({
       url: '/v2/user/me',
       data: {
       property_keys: ["kakao_account.email","kakao_account.profile.nickname"]
          },success: function(res) {
             var id = res.id;
            scope : 'profile_nickname, account_email';
            alert('로그인성공');
       
            var param = {
            NAME : res.kakao_account.profile.nickname,
            ID : res.kakao_account.email,
            //user_id : id,  
          }
       
               $.ajax({
                  url:'KakaoLoginCon.do',
                  type: 'post',
                  data: param,
                  success: function(res){
                  location.href="./Main.jsp";
                 }
               })    
        }
          })
          console.log(authObj);
          var token = authObj.access_token;
        },
        fail: function(err) {
        alert(JSON.stringify(err));
        }
      });    
}) 
</script>

   <!-- 회원가입 ajax -->
   <script>
    $('#join_btn').on('click', function(){
        var ID = $('#joinID').val();
        var PW = $('#joinPW').val();
        var NAME = $('#joinNAME').val();
        console.log("ID: "+ID);
          console.log("PW: "+PW);
        console.log("NAME: "+NAME);
        
        $.ajax({
           url : "JoinCon",
           dataType: "text",
            data : {
               ID : ID,
               PW : PW,
               NAME : NAME,
            }, //여기까지 통신하고 JoinCon으로 이동
           success : function(result){ 
              console.log(result+" : ajax이후")
               if(result==null){
                  alert('등록된 ID이거나 입력되지 않은 항목이 있습니다.');
               }else{
                  // 회원가입 성공 시
                  document.getElementById("modal3").style.display = "block"; //회원가입 완료 모달창
                  document.getElementById("join_name").innerHTML = result+"님,"; //회원가입 완료 모달창
                  /* $("#join_name").innerHTML(result+"님,"); */
               }
           },
           error : function(e){
               alert('등록된 ID이거나 입력되지 않은 항목이 있습니다.');
           }
       });
    });
    </script>

   <!-- 로그인 ajax -->
    <script>
    $('#login_btn').on('click', function(){
        var ID = $('#loginID').val();
        var PW = $('#loginPW').val();
        console.log("ID: "+ID);
        console.log("PW: "+PW);
        
        $.ajax({
           url : "LoginCon",
           dataType: "text",
            data : {
               ID : ID,
                PW : PW
            }, //여기까지 통신하고 LoginCon으로 이동
           success : function(result){ 
              console.log(result+" : ajax이후");
               if(result=="오라클 로그인 연결 실패"){
                  alert("등록되지 않은 회원입니다");
                  document.getElementById("modal2").style.display = "block"; // 회원가입 모달창
               }else{
                  window.location.href = "./Main.jsp";
               }
           },
           error:function(e){
               alert('로그인 통신실패');
           }
       });
    });
    </script>




</body>