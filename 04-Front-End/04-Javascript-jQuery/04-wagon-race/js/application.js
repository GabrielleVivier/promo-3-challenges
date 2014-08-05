$(function() {

  var table = $('<table class="race_table">');
  var row_player1 = $('<tr id="player1_race"></tr>');
  var row_player2 = $('<tr id="player2_race"></tr>');
  table.append(row_player1).append(row_player2);
  for(i=0; i<20; i++) {
    row_player1.append($('<td></td>'));
    row_player2.append($('<td></td>'));
  }
  $('div').append(table);

  var img_player1 = $('<img src="../img/player_1.png">');
  var img_player2 = $('<img src="../img/player_2.png">');


  $('#button').on('click', function() {

    $('#player1_race td img').remove();
    $('#player2_race td img').remove();

    var count_player1 = -1;
    var count_player2 = -1;

    $('.overlay').remove();
    $('.container').remove();

    $(document).on('keyup', function() {

      if ((count_player1) == 20 || (count_player2) == 20) {
        var overlay = $('<div class="overlay">');
        $('body').append(overlay);
        var container = $('<div class="container">');
        $('body').append(container);
        if(count_player1 > count_player2) {
          var message = "Player 1 wins";
        }
        else {
          var message = "Player 2 wins";
        }
        $('<p>').text(message).appendTo(".container");
      }

      if (event.which == 81) {
        count_player1 =  count_player1 + 1;
        $('#player1_race td').remove(img_player1);
        $('#player1_race td').eq(count_player1).append(img_player1);
      }
      else if (event.which == 77) {
        count_player2 = count_player2 + 1;
        $('#player2_race td').remove(img_player2);
        $('#player2_race td').eq(count_player2).append(img_player2);
      }

    });

  });

});