`import Ember from "ember"`

ParticipantRoute = Ember.Route.extend
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
