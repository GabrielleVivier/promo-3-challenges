/*
  *
  * TODO: add your code here!
  *
*/



$(function() {

  $("#message-wrapper").hide().delay(500).slideDown(1000);

  $("#message-wrapper").on("mouseenter", function(the_event) {
    $(this).slideDown(1000);
  });

  $("#message-wrapper").on("mouseleave", function(the_event) {
    $(this).slideUp(1000);
  });

  $("body").on("mousemove", function(event) {
    if (event.pageY < 50) {
      $("#message-wrapper").slideDown(1000);
    }
  });


});

