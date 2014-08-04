/*
  *
  * TODO: add your code here!
  *
*/

$("#message-wrapper").hide().slideDown(1000);

$(function() {
  $("#message-wrapper").on("click", function(the_event) {
    $(this).slideUp(1000);
  });
});

