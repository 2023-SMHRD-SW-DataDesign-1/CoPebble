// 추가하는 체크박스
function addCheckbox() {
    var newItem = document.getElementById("myInput").value;
    if (newItem !== "") {
        var container = document.createElement("div");

        var inputCheck = document.createElement("input");
        inputCheck.type = "checkbox";
        inputCheck.name = "customCheckbox";

        var labelCheck = document.createElement("label");
        labelCheck.textContent = newItem;

        var deleteButton = document.createElement("button");
        deleteButton.textContent = "삭제";
        deleteButton.onclick = function () {
            container.parentNode.removeChild(container);
        };

        container.appendChild(inputCheck);
        container.appendChild(labelCheck);
        container.appendChild(deleteButton);

        var checkboxContainer = document.getElementById("checkboxContainer");
        checkboxContainer.appendChild(container);

        var addBoxContainer = document.getElementById("addBox");
        if (addBoxContainer) {
            addBoxContainer.appendChild(container);
        } else {
            console.error("The 'addBox' container does not exist.");
        }


        document.getElementById("myInput").value = "";
    }
}
function insertValue(value) {
    document.getElementById("myInput").value += value;
}

// showImage 함수 정의

function showImage1() { //방
    var imagePath = './img/Room.png'; // 여기에 실제 이미지 파일 경로를 입력하세요.

    var imageElement = document.createElement('img');
    imageElement.src = imagePath;

    var imageContainer = document.getElementById('imageContainer');
    imageContainer.innerHTML = '';
    imageContainer.appendChild(imageElement);
}

let my_button2 = document.querySelector("#my_button2");
function showImage2() { //거실
    var imagePath = './img/diningRoom.png'; // 여기에 실제 이미지 파일 경로를 입력하세요.

    var imageElement = document.createElement('img');
    imageElement.src = imagePath;

    var imageContainer = document.getElementById('imageContainer');
    imageContainer.innerHTML = '';
    imageContainer.appendChild(imageElement);
}
function showImage3() { //주방
    var imagePath = './img/kitchen.png'; // 여기에 실제 이미지 파일 경로를 입력하세요.

    var imageElement = document.createElement('img');
    imageElement.src = imagePath;

    var imageContainer = document.getElementById('imageContainer');
    imageContainer.innerHTML = '';
    imageContainer.appendChild(imageElement);
}
function showImage4() { //화장실
    var imagePath = './img/bathRoom.png'; // 여기에 실제 이미지 파일 경로를 입력하세요.

    var imageElement = document.createElement('img');
    imageElement.src = imagePath;

    var imageContainer = document.getElementById('imageContainer');
    imageContainer.innerHTML = '';
    imageContainer.appendChild(imageElement);
}
function showImage5() { //식재료
    var imagePath = './img/refrigerator.png'; // 여기에 실제 이미지 파일 경로를 입력하세요.

    var imageElement = document.createElement('img');
    imageElement.src = imagePath;

    var imageContainer = document.getElementById('imageContainer');
    imageContainer.innerHTML = '';
    imageContainer.appendChild(imageElement);
}