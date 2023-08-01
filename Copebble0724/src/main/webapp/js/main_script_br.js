$('.delete_btn').click(function() {
	$(this).parent('.memo_box').remove();
});

$('.briefing_add').click(function() {
	$('#addEventPopup3').toggle();
});

$(document).ready(function() {
	$.ajax({
		type: 'POST',
		url: './MemoSelectCon',
		dataType: 'json',
		success: function(response) {
			console.log('메모 조회 성공', response);
			for (i = 0; i < response.length; i++) {
				const memoBox = `
                    <div class="memo_box">
                        <div>${response[i].WRITER}</div>
                        <div>${response[i].B_CONTENT}</div>
                        <button class="delete_btn" data-num="${response[i].num}">&times;</button>
                    </div>
                `;
				$('#MemoList').append(memoBox);
			}
		},
		error: function(error) {
			console.error('메모 조회 실패', error);
		}
	});
});

$(document).on('click', '.delete_btn', function() {
	const memoBox = $(this).parent('.memo_box');
	const manager = memoBox.find('div').eq(0).text();
	const title = memoBox.find('div').eq(1).text();
	const num = $(this).data('num'); 

	$.ajax({
		type: 'POST',
		url: './MemodeleteCon',
		data: {
			"manager": manager,
			"title": title,
			"num": num
		},
		dataType: 'text',
		async:false,
		success: function(response) {
			console.log('메모 삭제 성공', response);
			memoBox.remove();
		},
		error: function(error) {
			console.error('메모 삭제 실패', error);
		}
	});
});

$('#addMemoBtn').click(function() {
	const eventMemoTitle = $('#eventMemo').val();
	const eventMemoManager = $('input[name=memoManager]:checked').val();


			// 유효성 검사 수행
        if (eventMemoTitle.trim() === "" || eventMemoManager === "") {
            alert("모두 입력해주세요.");
            return;
        }
	$.ajax({
		type: 'POST',
		url: './MemoDataCon',
		data: {
			"manager": eventMemoManager,
			"title": eventMemoTitle
		},
		dataType: 'text',
		success: function(response) {
			console.log('브리핑 DB 서버 응답 성공', response);
			
			$.ajax({
		type: 'POST',
		url: './MemoSelectCon',
		dataType: 'json',
		async:false,
		success: function(response) {
			$('#MemoList').empty();
			console.log('메모 조회 성공', response);
			for (i = 0; i < response.length; i++) {
				const memoBox = `
                    <div class="memo_box">
                        <div>${response[i].WRITER}</div>
                        <div>${response[i].B_CONTENT}</div>
                        <button class="delete_btn" data-num="${response[i].num}">&times;</button>
                    </div>
                `;
				$('#MemoList').append(memoBox);
			}
		},
		error: function(error) {
			console.error('메모 조회 실패', error);
		}
	});
		},
		error: function(error) {
			console.error('브리핑 DB 서버 응답 실패', error);
		}
	});
	$('#addEventPopup3').hide();
	document.getElementById('eventMemo').value = '';
	$('input[name=memoManager]').prop('checked', false);
	$('#MemoList').html(response);
});

$('#cancelMemoBtn').click(function() {
	$('#addEventPopup3').hide();
	document.getElementById('eventMemo').value = '';
	$('input[name=memoManager]').prop('checked', false);
});

var memoPopupIsDragging = false;
var memoPopupDragX = 960;
var memoPopupDragY = 480;
var memoPopupOffsetX = 0;
var memoPopupOffsetY = 0;
var memoPopupEl = document.getElementById('addEventPopup3');

// deleteEventPopup 팝업 창 드래그 시작
function memoPopupStartDrag(e) {
	memoPopupIsDragging = true;
	memoPopupOffsetX = e.clientX - memoPopupDragX;
	memoPopupOffsetY = e.clientY - memoPopupDragY;
}

// deleteEventPopup 팝업 창 드래그 중
function memoPopupDrag(e) {
	if (memoPopupIsDragging) {
		memoPopupDragX = e.clientX - memoPopupOffsetX;
		memoPopupDragY = e.clientY - memoPopupOffsetY;
		memoPopupEl.style.left = memoPopupDragX + 'px';
		memoPopupEl.style.top = memoPopupDragY + 'px';
	}
}

// deleteEventPopup 팝업 창 드래그 종료
function memoPopupEndDrag() {
	memoPopupIsDragging = false;
}

// deleteEventPopup 팝업 창 드래그 이벤트 리스너 등록
memoPopupEl.addEventListener('mousedown', memoPopupStartDrag);
document.addEventListener('mousemove', memoPopupDrag);
document.addEventListener('mouseup', memoPopupEndDrag);