$(document).on('turbolinks:load', function() {
    $('.nav-item').click(function() {
      $(this).addClass('active').siblings('.active').removeClass('active');
    });
});
