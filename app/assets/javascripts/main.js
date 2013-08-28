$(function() {
  compSigh();
  checkIncreasing();
});

function compSigh() {
  $('#js-button').on('click', function(){
    $('#comp-sci').text("Comp-Sigh");
    $('body').addClass('pink');
    $('body').css('background-color', 'pink');
    $('#js-button').attr('disabled', true);
  });
}

function checkIncreasing() {
  $('#quiz-button').on('click', function(){
    var arr = $('#input').val();
    arr = arr.split(',');
    for (i=0; i<arr.length; i++) {
      arr[i] = parseInt(arr[i]);
    }
    var isSorted = true;
    for (i=0; i<arr.length-1; i++) {
     if (arr[i] <= arr[i+1]) {
     isSorted = true;
     } else {
     isSorted = false;
     }
    }
    if (isSorted) {
      $('body').removeClass('red');
      $('body').addClass('green');
      $('body').css('background-color', 'green');
    } else {
      $('body').removeClass('green');
      $('body').addClass('red');
      $('body').css('background-color', 'red');
    }
  });
}