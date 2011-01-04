$(function() {
  $(window.applicationCache).bind("error", function() {
    alert("There was an error when loading the cache manifest.");
  });
});