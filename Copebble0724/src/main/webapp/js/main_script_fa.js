$(document).ready(function() {
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

  // Apply random color to todo items
  function applyRandomColorToElement(element) {
    const randomColor = getRandomColorFromArray(colors);
    element.style.backgroundColor = randomColor;
  }

  // Helper function to get random color from the array
  function getRandomColorFromArray(colorArray) {
    const randomIndex = Math.floor(Math.random() * colorArray.length);
    return colorArray[randomIndex];
  }

  // Event delegation for add and delete buttons
  $(document).on('click', '.familynotice_add', function() {
    $('#addEventPopup2').toggle();
  });

  $(document).on('click', '#addTodoBtn', function() {
    const eventTodoTitle = $('#eventTodoTitle').val();
    const eventTodoStart = $('#eventTodoStart').val();
    const eventTodoEnd = $('#eventTodoEnd').val();
    const eventTodoManager = $('input[name=Manager]:checked').val();

    // AJAX request to send data to the server
    $.ajax({
      type: 'POST',
      url: './todoData',
      data: { "title": eventTodoTitle, 'start': eventTodoStart, 'end': eventTodoEnd, 'manager': eventTodoManager },
      dataType: 'text',
      success: function(response) {
        console.log('Data sent successfully!!!');
      },
      error: function(xhr, status, error) {
        console.error('Error sending data to the server:', error);
      }
    });

    // To-do list item template
    const todoItem = `
      <li class="todo-item">
        <input type="checkbox"/>
        ${eventTodoManager} ${eventTodoTitle}
        ${eventTodoStart} ~ ${eventTodoEnd}
        <button class="deleteTodoBtn">X</button>
      </li>
    `;

    // Append the new item to the todo list
    $('#todoList').append(todoItem);

    // Apply random color to the new todo item
    const newTodoItem = $('#todoList li').last()[0];
    applyRandomColorToElement(newTodoItem);

    // Close the add event popup and reset input fields
    $('#addEventPopup2').hide();
    $('#eventTodoTitle').val('');
    $('#eventTodoStart').val('');
    $('#eventTodoEnd').val('');
    $('input[name=Manager]').prop('checked', false);
  });

  $(document).on('click', '.deleteTodoBtn', function() {
    // Remove the clicked todo item from the list
    $(this).parent().remove();
  });

  // Main box random color
  const myBox = document.getElementById('myBox');
  myBox.addEventListener('click', () => {
    const newColor = getRandomYellowColor();
    myBox.style.backgroundColor = newColor;
  });

  // Helper function to get random yellow color
  function getRandomYellowColor() {
    const yellowColors = [
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
    const randomIndex = Math.floor(Math.random() * yellowColors.length);
    return yellowColors[randomIndex];
  }

  // DB data retrieval and rendering (for demonstration)
  //addTodoItem("안녕하신가?", "07-22 ~ 07-31");
});

$(document).on('dragstart', '.todo-item', function(e) {
  draggedItem = e.target;
  e.originalEvent.dataTransfer.setData('text/plain', '');
});

$(document).on('dragover', '.todo-item', function(e) {
  e.preventDefault();
});

$(document).on('drop', '.todo-item', function(e) {
  e.preventDefault();
  const dropTarget = e.target;

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