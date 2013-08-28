



$(function() {

  $('#funky').on('click', function(){
    $('h1').text('Comp-Sigh');
    $('body').addClass("pink");
    $('#funky').attr("disabled", true);
  });

  $('#awesome-button').on('click', function(){
    check_increasing();

  });

});


cool = {

   check_increasing: function() {
    var array = [];
    var numb_string = $('#maths').val();
    var a = numb_string.split(',');
     for (var i = 0; i < a.length; i++) {
      array.push(parseInt(a[i]));
     }

   }

};