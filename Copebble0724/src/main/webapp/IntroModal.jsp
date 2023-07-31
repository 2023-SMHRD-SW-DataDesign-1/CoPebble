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

<!-- 부트스트랩 태그 및 무료 아이콘 태그 모으는 곳 -->
<script src="https://kit.fontawesome.com/a34da1aa1b.js" crossorigin="anonymous"></script>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
   crossorigin="anonymous">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" />
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="css/main_style.css">
<link rel="stylesheet" href="./css/IntroModal.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<style>

 * {
            font-family: 'NanumSquareAcb';
        }

</style>


</head>

<body>
   <!--헤더-->

  <header class="header_main mt-3">
    <div style="width: 300px;"></div>
    <c:choose>
        <c:when test="${info!=null}">
            <div style="width: 5%; min-width: 150px;">
                <a href="Main.jsp">
                    <img class="header_logo" src="./img/0729logomain-01.png" alt="">
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
        </c:when>
        <c:otherwise>
            <div style="width: 5%; min-width: 150px;">
                <a href="#">
                    <img class="header_logo" src="./img/0729logomain-01.png" alt="">
                </a>
            </div>
            <div style="width: 20px;"></div>
            <div style="min-width: 140px;">
                <a href="#" class="baby_diary">
                    <p>육아 다이어리</p>
                </a>
            </div>
            <div style="min-width: 140px;">
                <a href="#" class="baby_diary">
                    <p>집안일 관리</p>
                </a>
            </div>
        </c:otherwise>
    </c:choose>
    <div style="width: 40%;"></div>
    <!-- 로그인 로고 -->
    <div style="min-width: 70px;">
        <button id="loginModal_btn">로그인</button>
    </div>
    <!-- 회원가입 로고 -->
    <div style="min-width: 90px;">
        <button id="joinModal_btn">회원가입</button>
    </div>
</header>
   
   
   <!--메인-->
  
   <!--메인-->

   <main>
      <div>
         <img id="img1" src="./img/main0728_02-01.png"
            style="width: 1728px; height: 972px;"> <img id="img2"
            src="./img/family09-01.png" style="width: 1728ppx; height: 972px;">
      </div>

      <div>
         <img src="./img/main_02.png" class="leftSlide" id="slide1"> <img
            src="./img/re_computer4-01.png" class="rightSlide" id="slide2"
            style="width: 40%;">
      </div>

      <div>
         <img src="./img/3slide-01.png" class="leftSlide2" id="img3"
            style="width: 650px;"> <img src="./img/re_computer4-01.png"
            class="rightSlide2" id="img4" style="width: 40%;">
      </div>
   </main>
      <!-- 로그인 모달창 -->
        <div id="modal1" class="modalBack">
            <div class="modal-content">
                <span class="close-btn">&times;</span>
                <div class="header_logo2"></div> <br>
                <p style="margin-bottom: 1%; font-weight: bold; text-align:center; font-size:40px">Login</p>
                <p style="margin-bottom: 1%; font-weight: bold;">아이디</p>
                <input type="text" name="id" id="loginID" placeholder="  아이디를 입력하세요">
                <p style="margin-bottom: 1%; font-weight: bold;">비밀번호</p>
                <input type="password" name="pw" id="loginPW" placeholder="  비밀번호를 입력하세요">
                <input type="submit" value="로 그 인" id="login_btn"> 
                <!-- <input type="submit" value="카 카 오 로 그 인" id="kakao-login-btn"> -->
                <img src="https://i.ibb.co/Wxf8vSJ/0729re-01.png" id="kakao-login-btn" style="cursor: pointer;">

                <hr class="hr">
                <input type="submit" value="회 원 가 입" id="joinModal_btn2"> <!-- 회원가입 모달창 열기 -->
            </div>
        </div>

      <!-- 회원가입 모달창 -->
      <div id="modal2" class="modalBack">
         <div class="modal-content">
            <span class="close-btn">&times;</span>
            <div class="header_logo2"></div><br>
            <p style="margin-bottom: 1%; font-weight: bold;">아이디</p>
            <input type="text" name="ID" id="joinID" placeholder="  아이디를 입력하세요">
            <p style="margin-bottom: 1%; font-weight: bold;">비밀번호</p>
            <input type="password" name="PW" id="joinPW" placeholder="  비밀번호를 입력하세요">
            <p style="margin-bottom: 1%; font-weight: bold;">비밀번호 확인</p>
            <input id="pwCheck" type="text" name="pwCheck" placeholder="  비밀번호를 확인 해 주세요">
            <p style="margin-bottom: 1%; font-weight: bold;">이름</p>
            <input type="text" name="NAME" id="joinNAME" placeholder="  이름을 입력하세요">
            <input type="submit" value="회 원 가 입" id="join_btn"> <!-- 회원가입 ajax -->
         </div>
      </div>

      <!-- 회원가입완료 모달창 -->
      <div id="modal3" class="modalBack">
         <div class="modal-content">
            <span class="close-btn">&times;</span>
            <div class="header_logo3"></div>
              <h1 id="join_name"></h1> <!------------------------------- ajax로 값 가져오기 -->
            <h2>WithDAY<br>가입을 축하드립니다.</h2>
            <a href="FamilyKey.jsp"> 
               <input type="submit" value="패밀리키 등록하기" id="goFamily">
            </a>
            <h5>패밀리키 등록 후 이용 바랍니다.</h5>
          
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
        	  console.log(res);
             var id = res.id;
            scope : 'profile_nickname, account_email';
       
            var param = {
            NAME : res.kakao_account.profile.nickname,
            ID : res.kakao_account.email,
            accesstoken : authObj.access_token
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
                  alert('회원가입 통신실패');
               }else{
                  // 회원가입 성공 시 회원가입 완료 모달창
                   document.getElementById("modal3").style.display = "block"; 
                    // 모달창 내에 result에 담긴 이름 출력하기
                   document.getElementById("join_name").innerHTML = result+"님,"; 
                   /* $("#join_name").innerHTML(result+"님,"); */
               }
           },
           error : function(e){
               alert('등록된 ID가 있거나 입력되지 않은 항목이 있습니다.');
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
               if(result =="오라클 로그인 연결 실패"){
                  alert("등록되지 않은 회원입니다");
                  document.getElementById("modal2").style.display = "block"; // 회원가입 모달창
               }else{
                  window.location.href = "./Main.jsp";
               }
           },
           error : function(e){
               alert('로그인 통신실패');
           }
       });
    });
    </script>
    
    <Script>
      $(document).ready(function() {
         /*웹페이지 열었을 때*/
         $("#img1").show();
         $("#img2").hide();
         $("#img3").hide();
         $("#img4").hide();

         /*img1을 클릭했을 때 img2를 보여줌*/
         $("#img1").click(function() {
            $("#img1").fadeOut();
            $("#img2").fadeIn(2000);
            $("#slide1").hide();
            $("#img3").fadeIn(3000);
            $("#slide2").fadeOut();
            $("#img4").fadeIn(1000);

         });

         /*img2를 클릭했을 때 img1을 보여줌*/
         $("#img2").click(function() {
            $("#img1").fadeIn(1000);
            $("#img2").fadeOut(1000);
      

         });
      });

   
   </Script>




</body>