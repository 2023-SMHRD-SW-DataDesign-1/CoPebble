// JavaScript



document.getElementById("file_input").addEventListener("change", function() {
	// 파일이 선택되었을 때 미리 보기 업데이트 함수 호출
	showPreviewImage();
});

function showPreviewImage() {
	const fileInput = document.getElementById("file_input");
	const imagePreview = document.getElementById("image_preview");

	if (fileInput.files && fileInput.files[0]) {
		// FileReader 객체를 사용하여 선택한 파일의 내용을 읽어옵니다.
		const reader = new FileReader();

		reader.onload = function(event) {
			// 읽어온 파일 데이터를 이미지 미리 보기에 설정합니다.
			imagePreview.src = event.target.result;
		};

		// 파일을 Data URL로 읽어옵니다. (이미지 데이터를 Base64로 인코딩)
		reader.readAsDataURL(fileInput.files[0]);
	} else {
		// 파일을 선택하지 않았거나 오류가 발생한 경우 미리 보기 이미지를 초기화합니다.
		imagePreview.src = "";
	}
}

var today = new Date();

var year = today.getFullYear();
var month = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);

var dateString = year + '-' + month + '-' + day;

document.getElementById("diary_write_date_p").innerHTML = dateString;



// 버튼 클릭 이벤트에 submitForm 함수 연결
var diary_upload_btn = document.getElementById("diary_upload_btn");
diary_upload_btn.addEventListener("click", submitForm);

