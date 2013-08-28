// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs

function check_increasing(numbers) {
  var len = numbers.length - 1;
  for (var i = 0; i < len; i++) {
    if(numbers[i] > numbers[i+1]) {
      $('body').css("background-color", "red");
      return;
    }
  }
  $('body').css("background-color", "green");
}

$(function() {
  $('#my-button').click(function() {
    $('h1').html('Comp-Sigh');
    $('body').addClass('pink').css('background-color', 'pink');
    $(this).prop("disabled",true);
  });

  $('#calc').click(function() {
    var nums = ($('#my-input').val()).split(',');
    check_increasing(nums);
  });
});