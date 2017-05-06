$(document).on('turbolinks:load', function() {
  //$('.nav-item').click(function() {
  //  $(this).addClass('active').siblings('.active').removeClass('active');
  //});
  var tag_param = getURLParameter("tag_id");
  if (tag_param) {
      var tag_id = "#tag-" + tag_param
      $(tag_id).addClass('active').siblings('.active').removeClass('active');
  }
  /*
  $('.pagination').click(function() {
      var tag_id = "#tag-" + getURLParameter("tag_id");
      console.log(tag_id);
      $(tag_id).addClass('active').siblings('.active').removeClass('active');
  });
  */

  
});

function getURLParameter(name) {
  return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search) || [null, ''])[1].replace(/\+/g, '%20')) || null;
}
