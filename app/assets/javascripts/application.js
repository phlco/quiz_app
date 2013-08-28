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
var counter = 0;
Array.prototype.clone = function() {
  return this.slice(0);
};
$(function(){
  $('#click-me').click(function(){
    console.log("clicked");
    $('#comp-sci').html('Comp-Sigh');
    $('body').addClass('pink').css("background-color", "pink");
    $('#click-me').attr("disabled", true);
  });

  $('#calc-button').click(function(){
    console.log("clicked");
    var numbers_string = $('#input-value').val();
    var numbers_array = numbers_string.split(',');
    for(var i=0; i < numbers_array.length; i++) {
      numbers_array[i] = +numbers_array[i];
    }
    var j = 0;
    var clone = numbers_array.slice(0);
    var sorted = numbers_array.sort();
    for(j = 0; j < numbers_array.length; j ++ ) {
      if (clone[j] === sorted[j]) {
        counter += 1;
      }
    }
    if(counter === numbers_array.length) {
      $('body').css("background-color", "green");
    } else {
      $('body').css("background-color", "red");
    }
    $('#input-value').val("");
    counter = 0;
  });


});
