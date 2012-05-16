Entries = new Meteor.Collection("entries")

if Meteor.is_client
  Template.raffle.entries = -> Entries.find()
  
  Template.raffle.events =
    'submit #new_entry': (event) ->
      event.preventDefault()
      Entries.insert(name: $('#new_entry_name').val())
      $('#new_entry_name').val('')
    
    'click #draw': ->
      winner = _.shuffle(Entries.find(winner: {$ne: true}).fetch())[0]
      if winner
        Entries.update({recent: true}, {$set: {recent: false}}, {multi: true})
        Entries.update(winner._id, $set: {winner: true, recent: true})
  
  Template.entry.winner_class = ->
    if this.recent then 'highlight' else ''
