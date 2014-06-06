ParticipantRoute = Ember.Route.extend
  model: ->
    @store.find 'participant'

`export default ParticipantRoute`
