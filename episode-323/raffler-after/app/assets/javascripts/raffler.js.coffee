window.Raffler =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Raffler.Routers.Entries()
    Backbone.history.start()

$(document).ready ->
  Raffler.init()
