// Your validation code will go in there.
// Write your validation functions, and bind events
// in a jQuery DOM ready callback

var validateInputs = function() {
  return $('.form-group.has-success').length == $('.form-group').length;
  // each(function(index, element) {
  //   console.debug($(element).hasClass('has-error'));
  //   if ($(element).hasClass('has-error')) {
  //     return false;
  //   }
  //   return true;
  // });
};

var validateForm = function() {
  if (validateInputs() == true) {
    $('button').removeAttr('disabled');
  };
};

// var validateInputs = function() {

// };

function red(elem) {
  $(elem).parent().removeClass('has-success');
  $(elem).parent().addClass('has-error');
};


function green(elem) {
  $(elem).parent().removeClass('has-error');
  $(elem).parent().addClass('has-success');
};

function validateField(elem) {
  if(elem.value.length == 0) {
    red(elem);
  }
  else {
    green(elem);
  }
};

function validateEmail(elem) {
  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
  var email = $('.email').val();
  console.debug(email);
  if(!emailReg.test(email)) {
    red(elem);
  }
  else {
    green(elem);
  }
};

function validateZip(elem) {
  var zipReg = /^\d{4,5}$/;
  var zip = $('.zip').val();
  if(!zipReg.test(zip)) {
    red(elem);
  }
  else {
    green(elem);
  }
};

function validatePhone(elem) {
  var phoneReg = /^06\d{8}$/;
  var phone = $('.phone').val();
  if(!phoneReg.test(phone)) {
    red(elem);
  }
  else {
    green(elem);
  }
};

$(function() {

  $('.form-control').focusout(function() {
    console.debug(this);
    validateField(this);
    if ($(this).hasClass('email')) {
      validateEmail(this);
    }
    if ($(this).hasClass('zip')) {
      validateZip(this);
    }
    if ($(this).hasClass('phone')) {
      validatePhone(this);
    }
    validateForm();
  });

});