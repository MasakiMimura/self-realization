$(function() {
    function buildHTML(todo) {
    var html = $('<li class="right-content__todo__todos__list">').append(todo.content);
    return html;
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
      $('.right-content__todo__todos').append(html);
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