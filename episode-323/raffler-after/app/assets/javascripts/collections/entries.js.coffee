class Raffler.Collections.Entries extends Backbone.Collection
  url: '/api/entries'

  drawWinner: ->
    nonWinners = _.reject @shuffle(), (entry) ->
      entry.get('winner')
    winner = nonWinners[0]
    if winner
      winner.set({winner: true})
      winner.save()
      winner.trigger('highlight')
