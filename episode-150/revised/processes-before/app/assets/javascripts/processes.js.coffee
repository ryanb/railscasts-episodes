# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  if $('#processes').length
    update = ->
      $.get '/processes/list', (list) -> $('#processes').text(list)
    setInterval(update, 3000)
    update()
