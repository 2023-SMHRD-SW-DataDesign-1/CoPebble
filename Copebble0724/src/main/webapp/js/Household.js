
// 집안일 등록 ajax *****************************************************
$(document).ready(function() {
	$('#add_btn').on('click', function() {
		var WORK = $('#myInput').val();

		console.log("myInput: " + WORK);

		const showBox = `
        <div class="showBox">
            <div>${WORK} <button class="Delete_btn">삭제</button></div>
        </div>
        `;
		$('#household_list').append(showBox);

		$.ajax({
			type: 'POST',
			url: "HouseholdAddCon",
			dataType: "text",
			data: {
				WORK: WORK
			}, // 여기까지 통신하고 Con으로 이동

			success: function(response) {
				console.log("오라클 저장 완료");
			},
			error: function(e) {
				console.log("오라클 저장 실패");
			}
		});
	});
});


// 집안일 삭제 코드 *************************************
$(document).on('click', '.Delete_btn', function() {
	console.log("클릭");
    var deleteItem = $(this).closest('.showBox');
    var WORK = deleteItem.find('div:first-child').text().trim();
    console.log(WORK);
    $.ajax({
        type: 'POST',
        url: "HouseholdDeleteCon",
        dataType: "text",
        data: {
            "WORK" : WORK
        },
        success: function(response) {
            console.log("집안일 삭제 성공");
            deleteItem.remove();
        },
        error: function(e) {
           	console.error('집안일 삭제 실패', error);
        }
    });
});

// 저장된 집안일 보여주는 ajax *******************************************

$(document).ready(function() {
	$.ajax({
		type: 'POST',
		url: "HouseholdShowCon",
		dataType: "json",
		//여기까지 통신하고 Con으로 이동

		success: function(response) {
			console.log("집안일 조회 성공", response);
			for (i = 0; i < response.length; i++) {
				const showBox = `
               <div class="showBox">
                    <div>${response[i].WORK} <button class="Delete_btn">삭제</button></div>
                </div>
               `;
				$('#household_list').append(showBox);
			}
		},
		error: function(e) {
			alert('집안일 조회 실패', error);
		}
	});
}); 