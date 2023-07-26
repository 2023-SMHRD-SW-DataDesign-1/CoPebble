
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
			// 시작일과 종료일 입력 필드 초기화
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
				color: eventColor, // 일정의 색상을 사용자가 선택한 색상으로 지정
				textColor: '#000000', // 일정의 글자색을 검은색으로 지정
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
/*
// familynotice_add 버튼에 클릭 이벤트 리스너 추가
$('.familynotice_add').click(function() {
	// addEventPopup2 요소의 가시성을 토글합니다.
	$('#addEventPopup2').toggle();
});

// 일정 추가 버튼 이벤트 처리
$('#addTodoBtn').click(function() {
	const eventTodoTitle = $('#eventTodoTitle').val();
	const eventTodoStart = $('#eventTodoStart').val();
	const eventTodoEnd = $('#eventTodoEnd').val();
	const eventTodoManager = $('input[name=Manager]:checked').val();


	// AJAX를 사용하여 데이터 서버에 보내기
	$.ajax({
		type: 'POST',
		url: './todoData',
		data: { "title": eventTodoTitle, 'start': eventTodoStart, 'end': eventTodoEnd, 'manager': eventTodoManager },
		dataType: 'text',
		success: function(response) {

			console.log('데이터 전송 성공!!!');

		},
		error: function(xhr, status, error) {
			console.error('데이터를 서버에 전송하는 중 오류 발생:', error);

		}
	});

	// To-do 리스트에 새로운 항목 추가
	const todoItem = `
		<li>
			<input type="checkbox"/>
			${eventTodoManager} ${eventTodoTitle}
			${eventTodoStart} ~ ${eventTodoEnd}
			<button class="deleteTodoBtn">X</button>
		</li>
	`;
	$('#todoList').append(todoItem);

	// 일정 추가 창 닫기
	$('#addEventPopup2').hide();
	// 입력 필드 초기화
	document.getElementById('eventTodoTitle').value = '';
	document.getElementById('eventTodoStart').value = '';
	document.getElementById('eventTodoEnd').value = '';
	$('input[name=Manager]').prop('checked', false);
});
// 삭제 버튼 클릭 이벤트 처리
$(document).on('click', '.deleteTodoBtn', function() {
	// 클릭한 삭제 버튼이 속한 항목을 To-do 리스트에서 제거합니다.
	$(this).parent().remove();
});

// 취소 버튼 이벤트 처리
$('#cancelTodoBtn').click(function() {
	// 일정 추가 창 닫기
	$('#addEventPopup2').hide();
	// 입력 필드 초기화
	document.getElementById('eventTodoTitle').value = '';
	document.getElementById('eventTodoStart').value = '';
	document.getElementById('eventTodoEnd').value = '';
	$('input[name=Manager]').prop('checked', false);
});



// 가족알림장 리스트 생성
function createTodoItem(text, date) {
	const li = document.createElement('li');
	li.classList.add('todo-item'); // 클래스 이름을 'todo-item'으로 설정
	li.draggable = true; // 리스트 아이템을 드래그 가능하도록 설정
	li.innerHTML = `
		<input type="checkbox" />
		${text}
		${date}
		<button class="deleteTodoBtn">X</button>
	`;
	return li;
}

// 새로운 할일 리스트 아이템을 리스트에 추가하는 함수
function addTodoItem(text, date) {
	const todoList = document.getElementById('todoList');
	const newItem = createTodoItem(text, date);
	todoList.appendChild(newItem);
}
// DB에 저장된 리스트 불러오기!
addTodoItem("남자 나는 탈주 할것이다!", "07-22 ~ 07-31");
addTodoItem("남자 아무것도하기싫다!", "07-20 ~ 07-31");

//가족알림장 드래그앤드롭
let draggedItem = null;

// 드래그 앤 드롭 기능 구현
$(document).off('dragstart', '.todo-item').on('dragstart', '.todo-item', function(e) {
	draggedItem = e.target;
	e.originalEvent.dataTransfer.setData('text/plain', ''); // 드래그 이벤트를 동작하기 위해 필요
});

$(document).off('dragover', '.todo-item').on('dragover', '.todo-item', function(e) {
	e.preventDefault();
});

$(document).off('drop', '.todo-item').on('drop', '.todo-item', function(e) {
	e.preventDefault();
	const dropTarget = e.target;

	// 만약 드롭한 요소가 리스트 아이템이면 해당 위치로 이동
	if ($(dropTarget).hasClass('todo-item')) {
		const dropIndex = $(dropTarget).index();
		const draggedIndex = $(draggedItem).index();

		if (dropIndex > draggedIndex) {
			$(dropTarget).after(draggedItem);
		} else {
			$(dropTarget).before(draggedItem);
		}
	}
});

$(document).ready(function() {
	$('#addTodoBtn').click(function() {
		const eventTodoTitle = $('#eventTodoTitle').val();
		const eventTodoStart = $('#eventTodoStart').val();
		const eventTodoEnd = $('#eventTodoEnd').val();
		const eventTodoManager = $('input[name=Manager]:checked').val();

		// To-do 리스트에 새로운 항목 추가
		const todoItem = `
	  <li class="todo-item">
		<input type="checkbox"/>
		${eventTodoManager} ${eventTodoTitle}
		${eventTodoStart} ~ ${eventTodoEnd}
		<button class="deleteTodoBtn">X</button>
	  </li>
	`;
		$('#todoList').append(todoItem);
	});
});



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
///////////////////////가족알림장 리스트 색깔 랜덤

const colors = [
	'#ffc6a5',
	'#fcf6dd',
	'#FFFFE6',
	'#ffd895',
	'#ffe3a3',
	'#FFFFF9',
	'#FFFFFC',
	'#FFFFFE',
	'#FFDD7C',
	'#FEFEF0'
];

// 가족알림장 리스트 색상 랜덤 출력
function getRandomColorFromArray(colorArray) {
	const randomIndex = Math.floor(Math.random() * colorArray.length);
	return colorArray[randomIndex];
}

// 여기서 특정 색깔만 출력할 예정!
function applyRandomColorToElement(element) {
	const randomColor = getRandomColorFromArray(colors);
	element.style.backgroundColor = randomColor;
}

// 페이지 로드 후 실행되는 함수
document.addEventListener("DOMContentLoaded", function() {
	const todoItems = document.querySelectorAll(".todo-item");
	todoItems.forEach(function(item) {
		applyRandomColorToElement(item);
	});
});


*/