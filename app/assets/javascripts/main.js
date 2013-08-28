$(function() {

  $('#click_me').click(function() {
    $('h1').text('Comp-Sigh');
    $('body').addClass('pink');
    $(this).attr('disabled', true);
  });
});
