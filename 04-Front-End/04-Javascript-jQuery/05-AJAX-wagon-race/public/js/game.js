var start_new_game = function() {
  $('#button').click(function() {
    $('#button').addClass('display-none');
    $('#form').removeClass('display-none');
  });
};

var playGame = function() {
  time = $.now()
  $(document).on('keyup', function() {
    if (event.which == 81) {
      $('#player1_race .active').removeClass('active').next('td').addClass('active');
      if ($('#player1_race .active').is(':last-child')) {
        winner = 0;
        console.debug(winner);
        time = $.now() - time;
        console.debug(time);
        alert('Player1 wins!');
      }
    }
    else if (event.which == 77) {
      $('#player2_race .active').removeClass('active').next('td').addClass('active');
      if ($('#player1_race .active').is(':last-child')) {
        winner = 1;
        console.debug(winner);
        time = $.now() - time;
        alert('Player2 wins!');
      }
    }
  });
};


$(function () {

  var session_id = 0;
  var game_id = 0;
  var winner = 0;
  var timer = 0;

  $.get( "http://localhost:4567/session/create", function(data) {
    $('#button').removeClass('display-none');
    console.log(data); // Code HTML
    start_new_game();
    session_id = data.id;
  });

  $('#form').on('submit', function(e) {
    e.preventDefault();
    var name_player1 = $('#name_player1').val();
    var name_player2 = $('#name_player2').val();
    var names = JSON.stringify({
      players: [
        { "name": name_player1 },
        { "name": name_player2 }
      ]
    });

    $.post("http://localhost:4567/session/" + session_id + "/game/create",
      names,
      function(data) {
        console.debug(data);
        game_id = data.game.id;
        console.debug(game_id);
        $('#form').addClass('display-none');
        $('table').removeClass('display-none');
        playGame();
        winner = data.game.players[winner].id;
        var game = JSON.stringify({
          "winner": winner,
          "elapsed_time": time
        });
        $.post("http://localhost:4567/game/" + game_id + "/finish",
          game,
          function(data) {
            $.get("http://localhost:4567/game/" + game_id + "/results", function(data) {
              console.debug(data);
            });
        });
        $.get("http://localhost:4567/session/" + session_id + "/games", function(data) {
          console.debug(data);
        });
      });

  });
});

