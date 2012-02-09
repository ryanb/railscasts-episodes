class Raffler.Views.Entry extends Backbone.View
  template: JST['entries/entry']
  tagName: 'li'

  initialize: ->
    @model.on('change', @render, this)
    @model.on('highlight', @highlight, this)

  highlight: ->
    $('#entries .winner').removeClass('highlight')
    @$('.winner').addClass('highlight')

  render: ->
    $(@el).html(@template(entry: @model))
    this
