$(function() {

  $('#button').on('click', function() {

    var overlay = $('<div class="overlay">');
    $('body').append(overlay).hide().fadeIn(0);

    var container = $('<div class="container">');
    $('body').append(container).hide().fadeIn(0);

    var img = $('<img src="http://obligement.free.fr/gfx/tvpaint_bouton5.jpg" id="modal">')
    $('body').append(img).hide().fadeIn(0);

    $('.overlay').on('click', function() {
      $('.overlay').fadeOut(300).remove();
      $('.container').fadeOut(200).remove();
      $('#modal').fadeOut(200).remove();
    }
    );
  }
  );


});