
var calendar = null;
var all_events = null;

function loadingEvents(jsondata) {
	var return_value = null;
	$.ajax({
		type: 'POST',
		data: {},
		url: "./calendarSelectCon",
		dataType: 'json',
		async: true
	})
		.done(function(result) { // 성공시 실행

			console.log("캘린더 DB 불러오기 성공");
			for (i = 0; i < result.length; i++) {
				calendar.addEvent({
					title: result[i].title,
					start: result[i].start,
					textColor: '#000000',
					end: result[i].end,
					color: result[i].color,
					allDay: true
				})
			}
		})
		.fail(function(request, status, error) { // 실패시 실행
			console.log("캘린더 DB 불러오기 실패");
		});
	return return_value;
}



document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	calendar = new FullCalendar.Calendar(calendarEl, {
		// 달력 설정 및 옵션
		locale: 'ko', // 한글로 월과 요일 표시
		dayCellContent: function(info) { // 1일 > 1로  숫자만 표현
			var number = document.createElement("a");
			number.classList.add("fc-daygrid-day-number");
			number.innerHTML = info.dayNumberText.replace("일", '').replace("日", "");
			if (info.view.type === "dayGridMonth") {
				return {
					html: number.outerHTML
				};
			}
			return {
				domNodes: []
			};
		},
		editable: true,
		allDay: true,
		dayMaxEventRows: true,
		events: loadingEvents(),
		eventDrop: function(info) {
			console.log('드래그 앤 드랍이 완료되었습니다.');
			allSave();
		},
		eventResize: function(info) {
			console.log('이벤트 리사이즈가 완료되었습니다.');
			allSave();
		},
		dateClick: function(info) { // 날짜 클릭 이벤트 핸들러
			// 팝업 창 표시

			document.getElementById('addEventPopup').style.display = 'block';
			document.getElementById('eventStart').value = info.dateStr;
			document.getElementById('eventEnd').value = info.dateStr;
		},
		// 이벤트 클릭 이벤트 핸들러
		eventClick: function(info) {

			currentEvent = info.event; // 현재 선택된 이벤트 저장
			// 팝업 창 표시            
			document.getElementById('deleteEventPopup').style.display = 'block';
		}
	});
	calendar.render();





	// 이벤트 데이터 추출 json

	function allSave() {
		var allEvent = calendar.getEvents()
		// console.log(allEvent);

		var events = new Array();
		for (var i = 0; i < allEvent.length; i++) {

			var obj = new Object();

			obj.title = allEvent[i]._def.title; // 타이틀
			// allEvent[i]._def.allDay; // 올데이
			obj.start = allEvent[i]._instance.range.start; // 시작일
			obj.end = allEvent[i]._instance.range.end; // 종료일
			obj.color = allEvent[i].backgroundColor; // 색상  

			events.push(obj);
		}
		var jsondata = JSON.stringify(events);
		savedata(jsondata);
	}



	function savedata(jsondata) {
		$.ajax({
			type: 'POST',
			url: "./saveData",//저장하는 함수 로직 만들것
			data: { "alldata": jsondata },
			dataType: 'text',
			async: false
		})
			.done(function(reuslt) { // 성공시 실행
				console.log("캘린더 저장하기 성공");
			})
			.fail(function(request, status, error) { // 실패시 실행
				console.log("캘린더 저장하기 실패");
			})
	}




	// 일정 추가 버튼 클릭 시
	document.getElementById('addEventBtn').addEventListener('click', function() {
		// 일정 제목과 시작일, 종료일 가져오기
		var eventTitle = document.getElementById('eventTitle').value;
		var eventStart = document.getElementById('eventStart').value;
		var eventEnd = document.getElementById('eventEnd').value;
		var eventColor = document.getElementById('eventColor').value;

		// 필수 입력 필드 확인
		if (eventTitle && eventStart && eventEnd && eventColor) {
			// end +1 추가
			var endDate = new Date(eventEnd);
			endDate.setDate(endDate.getDate() + 1);
			eventEnd = endDate.toISOString().slice(0, 10);
			// 일정 객체 생성
			var eventData = {
				title: eventTitle,
				start: eventStart,
				end: eventEnd,
				color: eventColor,
				textColor: '#000000',
				allDay: true
			};

			// 일정 추가
			calendar.addEvent(eventData);
			// 팝업 창 닫기
			document.getElementById('addEventPopup').style.display = 'none';
			// 입력 필드 초기화
			document.getElementById('eventTitle').value = '';
			document.getElementById('eventStart').value = '';
			document.getElementById('eventEnd').value = '';
			document.getElementById('eventColor').value = '';
			allSave();
		}
	});

	// 일정 삭제 버튼 클릭 시
	document.getElementById('confirmDeleteBtn').addEventListener('click', function() {
		// 팝업 창 닫기
		document.getElementById('deleteEventPopup').style.display = 'none';
		// 일정 삭제
		currentEvent.remove();
		allSave();
	});

	// 취소 버튼 클릭 시
	document.getElementById('cancelBtn').addEventListener('click', function() {
		// 팝업 창 닫기
		document.getElementById('addEventPopup').style.display = 'none';
		// 입력 필드 초기화
		document.getElementById('eventTitle').value = '';
		document.getElementById('eventStart').value = '';
		document.getElementById('eventEnd').value = '';
		document.getElementById('eventColor').value = '';
	});

	// 삭제 취소 버튼 클릭 시
	document.getElementById('cancelDeleteBtn').addEventListener('click', function() {
		// 팝업 창 닫기
		document.getElementById('deleteEventPopup').style.display = 'none';
	});
});


// 팝업 창 드래그 관련 변수
var isDragging = false;
var dragX = 960;
var dragY = 480;
var offsetX = 0;
var offsetY = 0;
var popupEl = document.getElementById('addEventPopup'); // 팝업 창 요소

// 팝업 창 드래그 시작
function startDrag(e) {
	isDragging = true;
	offsetX = e.clientX - dragX;
	offsetY = e.clientY - dragY;
}

// 팝업 창 드래그 중
function drag(e) {
	if (isDragging) {
		dragX = e.clientX - offsetX;
		dragY = e.clientY - offsetY;
		popupEl.style.left = dragX + 'px';
		popupEl.style.top = dragY + 'px';
	}
}

// 팝업 창 드래그 종료
function endDrag() {
	isDragging = false;
}

// 팝업 창 드래그 이벤트 리스너 등록
popupEl.addEventListener('mousedown', startDrag);
document.addEventListener('mousemove', drag);
document.addEventListener('mouseup', endDrag);

var deletePopupIsDragging = false;
var deletePopupDragX = 960;
var deletePopupDragY = 480;
var deletePopupOffsetX = 0;
var deletePopupOffsetY = 0;
var deletePopupEl = document.getElementById('deleteEventPopup');

// deleteEventPopup 팝업 창 드래그 시작
function deletePopupStartDrag(e) {
	deletePopupIsDragging = true;
	deletePopupOffsetX = e.clientX - deletePopupDragX;
	deletePopupOffsetY = e.clientY - deletePopupDragY;
}

// deleteEventPopup 팝업 창 드래그 중
function deletePopupDrag(e) {
	if (deletePopupIsDragging) {
		deletePopupDragX = e.clientX - deletePopupOffsetX;
		deletePopupDragY = e.clientY - deletePopupOffsetY;
		deletePopupEl.style.left = deletePopupDragX + 'px';
		deletePopupEl.style.top = deletePopupDragY + 'px';
	}
}

// deleteEventPopup 팝업 창 드래그 종료
function deletePopupEndDrag() {
	deletePopupIsDragging = false;
}

// deleteEventPopup 팝업 창 드래그 이벤트 리스너 등록
deletePopupEl.addEventListener('mousedown', deletePopupStartDrag);
document.addEventListener('mousemove', deletePopupDrag);
document.addEventListener('mouseup', deletePopupEndDrag);




// 날짜 받아오기
date = new Date();
year = date.getFullYear();
month = date.getMonth() + 1;
day = date.getDate();
document.getElementById("current_date").innerHTML = month + "월 " + day + "일";

//////////////////////////메인 박스 색깔 랜덤
const myBox = document.getElementById('myBox');

myBox.addEventListener('click', () => {
	const newColor = getRandomYellowColor();
	myBox.style.backgroundColor = newColor;
});

function getRandomYellowColor() {
	// 연한 노란색 계열의 색상들을 배열로 정의
	const yellowColors = [
		'#ffc6a5',
		'#fcf6dd',
		'#FFFFE6',
		'##ffd895',
		'#ffe3a3',
		'#FFFFF9',
		'#FFFFFC',
		'#FFFFFE',
		'#FFDD7C',
		'#FEFEF0',
	];
	// 배열에서 랜덤하게 색상 선택
	const randomIndex = Math.floor(Math.random() * yellowColors.length);
	return yellowColors[randomIndex];
}


