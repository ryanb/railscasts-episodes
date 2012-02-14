window.Raffler =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Raffler.Routers.Entries()
    Backbone.history.start(pushState: true)

$(document).ready ->
  Raffler.init()
