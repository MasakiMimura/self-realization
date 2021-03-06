$(function() {
  function buildHTML(todo) {
    let html = `
    <div class="right-content__todo__todos__box">
      <li class="right-content__todo__todos__box__list">
        <div class="right-content__todo__todos__box__list__title">
          ${todo.content}
        </div>
        <span class="right-content__todo__todos__box__list__btn--remove js-remove-btn" data-todo-id="${todo.id}">完了</span>
      </li>
    </div>
    `;
    $(".right-content__todo__todos").append(html);
  }

  $('.right-content__todo__form').on('submit', function(e) {
    e.preventDefault();
    var todo = $('.right-content__todo__form__text').val();
    $.ajax({
      type: 'POST',
      url: '/todos.json',
      data: {
        todo: {
          content: todo
        }
      },
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.right-content__todo__form')[0].reset();
      $('.right-content__todo__form__submit').prop('disabled', false);
      var result = $('.right-content__todo__form__submit').prop('disabled');
      console.log(result)
    })
    .fail(function() {
      alert('error');
      $('.right-content__todo__form__submit').prop('disabled', false);
    });
  });
  $(document).on("click", ".right-content__todo__todos__box__list__btn--remove", function() {
    const todoId = $(this).attr("data-todo-id");
    console.log(todoId)
    $(this)
      .parent()
      .remove();
  });
});