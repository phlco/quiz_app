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

window.onload = function() {
  $('#js-button').click(function() {
    $('h1').text('Comp-Sigh');
    $('body').addClass('pink');
    $(this).attr('disabled','disabled');
  });

  $('#calc').click(function() {
    var nums = $('#numbahs').val();
    check_increasing(nums);
  });

  var check_increasing = function(nums) {
    var increasing = true
    var arr = nums.split(",");
    console.log(arr);
    for (i = 0; i < arr.length; i++) {
      arr[i].replace(" ", "");
      arr[i] = parseInt(arr[i]);
      if (i > 0) {
        if (arr[i] < arr[i - 1]) {
          increasing = false;
        }
      }
    }
    console.log(arr);
    if (increasing === true) {
      $('body').removeClass('red');
      $('body').addClass('green');
    } else {
      $('body').removeClass('green');
      $('body').addClass('red');
    }
  };
};