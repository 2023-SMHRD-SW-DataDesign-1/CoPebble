function goToUpdate(index) {
	location.href = 'DiaryUpdate.jsp?num=' + index
}

const diaryModalBtn = document.getElementById('diary_modal_btn');
const diaryModal = document.getElementById('diary_modal');
const deleteBtn = document.getElementById('delete_btn');
const cancelBtn = document.getElementById('cancel_btn');

diaryModalBtn.addEventListener('click', () => {
	diaryModal.style.display = 'block';
});

cancelBtn.addEventListener('click', () => {
	diaryModal.style.display = 'none';
});
deleteBtn.addEventListener('click', () => {
	diaryModal.style.display = 'none';
	var deleteBtn = document.getElementById("deleteBtn");
	deleteBtn.addEventListener("click", submitForm);
});

