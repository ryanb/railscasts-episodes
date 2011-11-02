//= require jquery
//= require jquery_ujs
//= require_self
//= require_tree .

$(function() {
  var faye = new Faye.Client('http://localhost:9292/faye');
  faye.subscribe("/messages/new", function(data) {
    eval(data);
  });
});
