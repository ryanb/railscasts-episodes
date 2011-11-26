# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#person_state_id').parent().hide()
  states = $('#person_state_id').html()
  $('#person_country_id').change ->
    country = $('#person_country_id :selected').text()
    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(states).filter("optgroup[label='#{escaped_country}']").html()
    if options
      $('#person_state_id').html(options)
      $('#person_state_id').parent().show()
    else
      $('#person_state_id').empty()
      $('#person_state_id').parent().hide()
