// 추가하는 체크박스 ****************************************************
function addCheckbox() {
    // 입력 필드에서 새로운 항목을 가져옵니다.
    var newItem = document.getElementById("myInput").value;

    // 입력 필드가 비어있지 않을 때만 처리합니다.
    if (newItem !== "") {
        // 새로운 체크박스 컨테이너(div)를 생성합니다.
        var container = document.createElement("div");
        container.className = "checkbox-item";

        // 체크박스(input)를 생성하고 속성을 설정합니다.
        var inputCheck = document.createElement("input");
        inputCheck.type = "checkbox";
        inputCheck.name = "customCheckbox";

        // 항목 내용을 보여줄 라벨(label)을 생성하고 콘텐츠를 설정합니다.
        var labelCheck = document.createElement("label");
        labelCheck.textContent = newItem;
        labelCheck.setAttribute("id", "newWork"); //label에 newWork이라는 id값을 생성

        // 삭제 버튼(button)을 생성하고 콘텐츠를 설정합니다.
        var deleteButton = document.createElement("button");
        deleteButton.textContent = "삭제";

        // 삭제 버튼을 클릭할 때 해당 체크박스 컨테이너(div)를 삭제하는 함수를 할당합니다.
        deleteButton.onclick = function () {
            container.parentNode.removeChild(container);
        };

        // 생성한 요소들을 체크박스 컨테이너(div)에 추가합니다.
        container.appendChild(inputCheck);
        container.appendChild(labelCheck);
        container.appendChild(deleteButton);

        // 체크박스 컨테이너(div)를 'checkboxContainer' 요소에 추가합니다.
        var checkboxContainer = document.getElementById("checkboxContainer");
        checkboxContainer.appendChild(container);

        // 'addBox' 컨테이너가 있을 경우 해당 체크박스 컨테이너(div)를 추가합니다.
        var addBoxContainer = document.getElementById("addBox");
        if (addBoxContainer) {
            addBoxContainer.appendChild(container);
        } else {
            console.error("The 'addBox' container does not exist.");
        }

        // 새 항목 추가 후, 입력 필드를 비웁니다.
        document.getElementById("myInput").value = "";
    }
}

// 입력 필드에 값을 삽입하는 함수 ******************************************
function insertValue(value) {
    document.getElementById("myInput").value += value;
}

// 집안일 등록 ajax *****************************************************
      $('#add_btn').on('click', function() {
         var WORK = $('#newWork').text();

         console.log("newWork: " + WORK);

         $.ajax({
            type: 'POST',
            url : "HouseholdAddCon",
            dataType : "text",
            data : {
               WORK : WORK
            }, //여기까지 통신하고 Con으로 이동

            success : function(response) {
               console.log("");
            },
            error : function(e) {
               alert('오라클 통신 실패');
            }
         });
      });
      
      

   
   
   