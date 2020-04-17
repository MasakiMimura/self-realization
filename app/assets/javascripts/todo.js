$(function() {
    function buildHTML(todo) {
    let html = `
      <li class="right-content__todo__todos__list">${todo.content}</li>
      <a href="todos/${todo.id}" data-method="delete">削除</a>
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
      $('form')[0].reset();
      $('.right-content__todo__form__submit').prop('disabled', false);
      var result = $('.right-content__todo__form__submit').prop('disabled');
      console.log(result)
    })
    .fail(function() {
      alert('error');
      $('.right-content__todo__form__submit').prop('disabled', false);
    });
  });
});