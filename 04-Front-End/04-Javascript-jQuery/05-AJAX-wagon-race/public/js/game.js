var startNewSession = function() {
  $('#button-new-session').click(function() {
    $('#button-new-session').addClass('display-none');
    $('#form').removeClass('display-none');
  });
};

var resetGame = function() {
  $('#player1_race .active').removeClass('active');
  $('#player2_race .active').removeClass('active');
  $('#player1_race td:first-child').addClass('active');
  $('#player2_race td:first-child').addClass('active');
  $('#button-new-game').removeClass('display-none');
  $('table').addClass('display-none');
};

var playGame = function() {
  time = $.now()
  $(document).unbind('keyup').on('keyup', function() {
    if (event.which == 81) {
      $('#player1_race .active').removeClass('active').next('td').addClass('active');
      if ($('#player1_race .active').is(':last-child')) {
        winner_index = 0;
        console.debug(winner_index);
        time = $.now() - time;
        console.debug(time);
        alert('Player1 wins!');
        resetGame();
      }
    }
    else if (event.which == 77) {
      $('#player2_race .active').removeClass('active').next('td').addClass('active');
      if ($('#player2_race .active').is(':last-child')) {
        winner_index = 1;
        console.debug(winner_index);
        time = $.now() - time;
        alert('Player2 wins!');
        resetGame();
      }
    }
  });
};


$(function () {

  var session_id = 0;
  var game_id = 0;
  var winner_index = 0;
  var timer = 0;

  $.get( "http://localhost:4567/session/create", function(data) {
    $('#button-new-session').removeClass('display-none');
    console.log(data); // Code HTML
    startNewSession();
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

  $('#form').addClass('display-none');

  $.post("http://localhost:4567/session/" + session_id + "/game/create",
    names,
    function(data) {
      console.debug(data);
      game_id = data.game.id;
      console.debug(game_id);
      $('#button-new-game').removeClass('display-none');
      $('#button-new-game').click(function() {
        $('#button-new-game').addClass('display-none');
        $('table').removeClass('display-none');
        playGame();
        var winner = data.game.players[winner_index].id;
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
});

