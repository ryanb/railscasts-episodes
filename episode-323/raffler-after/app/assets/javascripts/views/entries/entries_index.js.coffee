class Raffler.Views.EntriesIndex extends Backbone.View
  template: JST['entries/index']

  events:
    'submit #new_entry': 'newEntry'
    'click #draw': 'drawWinner'
  
  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @addEntry, this)

  newEntry: (event) ->
    event.preventDefault()
    @collection.create(name: $('#new_entry_name').val())
    $('#new_entry_name').val('')

  drawWinner: (event) ->
    event.preventDefault()
    @collection.drawWinner()

  addEntry: (entry) ->
    view = new Raffler.Views.Entry(model: entry)
    $('#entries').append(view.render().el)

  render: ->
    $(@el).html(@template())
    @collection.each(@addEntry)
    this
