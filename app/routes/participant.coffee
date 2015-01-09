`import Ember from "ember"`

ParticipantRoute = Ember.Route.extend
  beforeModel: ->
    @csrf.fetchToken()
  ,
  model: ->
    @store.createRecord 'participant'
  ,
  actions:
    save: ->
      @currentModel.save().then (participant) ->
        @transitionTo 'participant.show', participant
    ,
    cancel: ->
      @transitionTo 'participants.index'

`export default ParticipantRoute`
