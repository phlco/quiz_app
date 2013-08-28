Array.prototype.clone = function() {
  return this.slice(0);
};

window.onload = function(){
  $('.click-button').click(function(){
    $('.comp-sigh').text("Comp-Sigh");
    $('body').addClass('pink');
    $('.click-button').attr("disabled", true);
  });

  $('.calc-submit').click(function(){
    var array = [];
    array.push($('input').val().split(','));
    for (var i=0; i < array[0].length; i++){
      array[0][i] = +array[0][i];
    }
    check_increasing(array);
  });
};

var check_increasing = function(array){
  var clone = array[0].clone();
  if (clone === array[0].sort()) {
    $('body').addClass('red');
  } else {
    debugger;
    $('body').addClass('green');
  }
};
