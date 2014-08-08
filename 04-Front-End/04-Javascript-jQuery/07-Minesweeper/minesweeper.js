// Good luck!

function reset(minesNumber) {
  $('table').removeClass('display-none');
  $('td').removeClass('mine');
  for(var i = 0; i < minesNumber ;  i++) {
    $('td').eq(Math.floor(Math.random()*$('td').length)).addClass('mine');
  }
};

function isFirstChild(target) {
  return $(target).is(':first-child');
};

function isLastChild(target) {
  return $(target).is(':last-child');
};

function bombsCount(td, index, number) {
  var i = 0;
  if (td[index+(number)]) {
    if ($(td[index+number]).hasClass('mine')) {
      return i = i + 1;
    }
    return i;
  }
  return i;
};

function checkBombs(target) {
  var bombs = 0;
  var td = $('td');
  var index = td.index(target);
  if (isLastChild(target)) {
    bombs = bombs + bombsCount(td, index, -1);
    bombs = bombs + bombsCount(td, index, -9);
    bombs = bombs + bombsCount(td, index, -8);
    bombs = bombs + bombsCount(td, index, 8);
    bombs = bombs + bombsCount(td, index, 7);
  }
  else if (isFirstChild(target)) {
    bombs = bombs + bombsCount(td, index, 1);
    bombs = bombs + bombsCount(td, index, -8);
    bombs = bombs + bombsCount(td, index, -7);
    bombs = bombs + bombsCount(td, index, 8);
    bombs = bombs + bombsCount(td, index, 9);
  }
  else {
    bombs = bombs + bombsCount(td, index, 1);
    bombs = bombs + bombsCount(td, index, -1);
    bombs = bombs + bombsCount(td, index, -7);
    bombs = bombs + bombsCount(td, index, 7);
    bombs = bombs + bombsCount(td, index, -8);
    bombs = bombs + bombsCount(td, index, 8);
    bombs = bombs + bombsCount(td, index, -9);
    bombs = bombs + bombsCount(td, index, 9);
  }
  console.debug(bombs);
  return bombs;
 // should return the number of nearest bombs (0, 1, 2, 3, 4)
};

function classIfBombs(bombsNumber) {
  // should return the class to add depending on nearest bombs (mine-neighbour-1, 2, 3, 4)
};

$(function() {

  var minesNumberEasy = 7;
  var minesNumberMedium = 10;
  var minesNumberHard = 15;

  $('#start').on('click', function() {
    $('td').addClass('unopened');
    $('#level').removeClass('display-none');
  });

  $('#level').on('click', function() {
    $(this).addClass('display-none');
    var target = $(event.target);
    if (target.is("#easy")) {
      reset(minesNumberEasy);
    }
    else if (target.is("#medium")) {
      reset(minesNumberMedium);
    }
    else if (target.is("#hard")) {
      reset(minesNumberHard);
    }
  });

  $('td')
    .on('contextmenu', function(e) {
      return false;
    })
    .on('mousedown', function(e) {
      e.preventDefault();
      var target = $(event.target);
      if (e.which === 3) {
        $(this).addClass('flagged');
      }
      else if (e.which === 1) {
        var bombs = checkBombs(this);
        $(this).removeClass('unopened').addClass('opened');
        if ($(this).hasClass('mine')) {
          alert('You lost!');
          if ($('td').hasClass('mine')) {
            $('.mine').removeClass('unopened');
          };
        }
        else if ($(this).hasClass('flagged')) {
          $(this).removeClass('flagged').addClass('unopened');
        }
        else if ($('td').hasClass('mine').length == $('td').hasClass('unopened')) {
          alert('You won!');
        }
        else {
          // should determine which img to apply
          if (bombs == 1) {
            $(this).addClass('mine-neighbour-1');
          }
          else if (bombs == 2) {
            $(this).addClass('mine-neighbour-2');
          }
          else if (bombs == 3) {
            $(this).addClass('mine-neighbour-3');
          }
          else if (bombs == 4) {
            $(this).addClass('mine-neighbour-4');
          }
        }
      }
    });

});