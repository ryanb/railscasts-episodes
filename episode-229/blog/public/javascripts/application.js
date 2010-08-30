$(function() {
  if ($("#comments").length > 0) {
    setTimeout(updateComments, 10000);
  }
});

function updateComments () {
  var article_id = $("#article").attr("data-id");
  if ($(".comment").length > 0) {
    var after = $(".comment:last-child").attr("data-time");
  } else {
    var after = "0";
  }
  $.getScript("/comments.js?article_id=" + article_id + "&after=" + after)
  setTimeout(updateComments, 10000);
}