$(document).ready(function() {
  // 함수로 입력 필드 초기화와 일정 추가 창 닫기를 처리하는 공통 코드 분리
  function hideAddEventPopup() {
    $('#addEventPopup2').hide();
    $('#eventTodoTitle').val('');
    $('#eventTodoStart').val('');
    $('#eventTodoEnd').val('');
    $('input[name=Manager]').prop('checked', false);
  }

function loadTodoList(lastTimestamp) {
  $.ajax({
    type: 'POST',
    url: './todoSelectCon',
    data: { lastTimestamp: lastTimestamp }, // 타임스탬프를 서버에 전송합니다.
    dataType: 'json',
    success: function(response) {
      console.log('알림장 조회 성공', response);
      $('.todoList').empty(); // 기존 목록 삭제
      for (let i = 0; i < response.length; i++) {
        const startDate = new Date(response[i].start);
        const endDate = new Date(response[i].end);

        const startMonth = String(startDate.getMonth() + 1).padStart(2, '0');
        const startDay = String(startDate.getDate()).padStart(2, '0');

        const endMonth = String(endDate.getMonth() + 1).padStart(2, '0');
        const endDay = String(endDate.getDate()).padStart(2, '0');

        const formattedStart = `${startMonth}-${startDay}`;
        const formattedEnd = `${endMonth}-${endDay}`;

        const todoItem = `
          <div class="memo_box">
            <div>${response[i].WHO}</div>
            <div>${response[i].title}</div>
            <div>${formattedStart}</div>
            <div>${formattedEnd}</div>
            <button class="Todo_delete_btn">X</button>
          </div>
        `;
        $('.todoList').append(todoItem); // 새로운 목록 추가
      }
    },
    error: function(error) {
      console.error('알림장 조회 실패', error);
    }
  });
}



  // 페이지가 로드될 때 할 일 목록을 서버에서 가져와 화면에 보여줌
  loadTodoList();
  
  // 5초마다 업데이트를 확인하는 폴링(polling) 설정
  setInterval(function() {
    // 기존 목록에서 마지막 타임스탬프를 찾아서 서버에 보냅니다.
    const lastTimestamp = $('.todoList').find('.memo_box:last-child div:eq(3)').text().trim();
    loadTodoList(lastTimestamp);
  }, 1000); // 원하는 간격으로 인터벌을 조정합니다. (예: 이 예제에서는 5초)

  // '가족알림장 추가' 버튼 클릭 이벤트 리스너
  $('.familynotice_add').click(function() {
    $('#addEventPopup2').toggle();
  });

  // 일정 추가 버튼 이벤트 처리
  $('#addTodoBtn').click(function() {
    const title = $('#eventTodoTitle').val();
    const start = $('#eventTodoStart').val();
    const end = $('#eventTodoEnd').val();
    const manager = $('input[name=Manager]:checked').val();

    // AJAX를 사용하여 데이터 서버에 보내기
    $.ajax({
      type: 'POST',
      url: './todoDataCon',
      data: { "title": title, 'start': start, 'end': end, 'manager': manager },
      dataType: 'text',
      success: function(response) {
   
      },
      error: function(xhr, status, error) {
        console.error('데이터를 서버에 전송하는 중 오류 발생:', error);
      }
    });
	
	loadTodoList()
	
    // To-do 리스트에 새로운 항목 추가 using jQuery
    const todoItem = `
      <div class="memo_box">
        <div>${manager}</div>
        <div>${title}</div>
        <div>${start}</div>
        <div>${end}</div>
        <button class="Todo_delete_btn">X</button>
      </div>
    `;
    $('.todoList').append(todoItem);

    // 일정 추가 창 닫기 및 입력 필드 초기화
    hideAddEventPopup();
  });

  // 삭제 버튼 클릭 이벤트 처리
  $(document).on('click', '.Todo_delete_btn', function() {
    const listItem = $(this).closest('.memo_box');
    const name = listItem.find('div').eq(0).text().trim();
    const title = listItem.find('div').eq(1).text().trim();
    const start = listItem.find('div').eq(2).text().trim();
    const end = listItem.find('div').eq(3).text().trim();
	
    // 서버에 해당 리스트의 정보를 삭제 요청합니다.
    $.ajax({
      type: 'POST',
      url: './todoDeleteCon',
      data: { "name": name, "title": title, 'start': start, 'end': end },
      dataType: 'text',
      success: function(response) {
        console.log('가족알림장 데이터 삭제 성공!!!');
        listItem.remove(); // 화면에서도 해당 항목 삭제
      },
      error: function(xhr, status, error) {
        console.error('가족알림장 데이터 삭제 실패', error);
      }
    });
  });

  // 취소 버튼 이벤트 처리
  $('#cancelTodoBtn').click(function() {
    hideAddEventPopup();
  });
});

var todoPopupIsDragging = false;
var todoPopupDragX = 960;
var todoPopupDragY = 480;
var todoPopupOffsetX = 0;
var todoPopupOffsetY = 0;
var todoPopupEl = document.getElementById('addEventPopup2');

// deleteEventPopup 팝업 창 드래그 시작
function todoPopupStartDrag(e) {
	todoPopupIsDragging = true;
	todoPopupOffsetX = e.clientX - todoPopupDragX;
	todoPopupOffsetY = e.clientY - todoPopupDragY;
}

// deleteEventPopup 팝업 창 드래그 중
function todoPopupDrag(e) {
	if (todoPopupIsDragging) {
		todoPopupDragX = e.clientX - todoPopupOffsetX;
		todoPopupDragY = e.clientY - todoPopupOffsetY;
		todoPopupEl.style.left = todoPopupDragX + 'px';
		todoPopupEl.style.top = todoPopupDragY + 'px';
	}
}

// deleteEventPopup 팝업 창 드래그 종료
function todoPopupEndDrag() {
	todoPopupIsDragging = false;
}

// deleteEventPopup 팝업 창 드래그 이벤트 리스너 등록
todoPopupEl.addEventListener('mousedown', todoPopupStartDrag);
document.addEventListener('mousemove', todoPopupDrag);
document.addEventListener('mouseup', todoPopupEndDrag);
