
// 팝업 연다
 function showDivBox() {
    var mypage_password_popup = document.getElementById("mypage_password_popup");
    mypage_password_popup.style.display = "block";
}

// 팝업 닫는다
function hideDivBox() {
    var mypage_password_popup = document.getElementById("mypage_password_popup");
    mypage_password_popup.style.display = "none";
}

// 버튼 클릭 이벤트다
var password_change = document.getElementById("password_change");
password_change.addEventListener("click", showDivBox);
