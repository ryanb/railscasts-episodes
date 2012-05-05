# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#book_author_tokens').tokenInput '/authors.json'
    theme: 'facebook'
    prePopulate: $('#book_author_tokens').data('load')
