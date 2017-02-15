/* Change logo color */
$(document).ready(function() {

  $(".closed-box").mouseenter(function() {
      $(".open-box").show();
      $(".closed-box").hide();
      $(this).hide();
  });

  $(".open-box").mouseout(function() {
    $(".closed-box").show();
    $(".open-box").hide();
    $(this).hide();
  });
});