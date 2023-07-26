 // ************버튼과 모달창 연결
 
 /* 메인단 로그인 버튼 누르면 작동 */
document.getElementById("loginModal_btn").addEventListener("click", function () {   
    document.getElementById("modal1").style.display = "block"; 
});

 /* 메인단 회원가입 버튼 누르면 작동 */
document.getElementById("joinModal_btn").addEventListener("click", function () {    
    document.getElementById("modal2").style.display = "block";
});

 /* 로그인 모달창 내 회원가입 모달창 */
document.getElementById("joinModal_btn2").addEventListener("click", function () {    
    document.getElementById("modal2").style.display = "block";
});


// 닫기 버튼 클릭 시 모달창 닫기
document.querySelectorAll(".close-btn").forEach(function (closeBtn) {
    closeBtn.addEventListener("click", function () {
        this.parentElement.parentElement.style.display = "none";
    });
});
