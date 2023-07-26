// 버튼과 모달창 연결
document.getElementById("deleteMemberModal_btn").addEventListener("click", function(){
   document.getElementById("modal4").style.display = "block";
});

// 닫기 버튼 클릭 시 모달창 닫기
document.querySelectorAll(".close-btn").forEach(function (closeBtn) {
    closeBtn.addEventListener("click", function () {
        this.parentElement.parentElement.style.display = "none";
    });
});