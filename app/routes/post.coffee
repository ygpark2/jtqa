`import Ember from "ember"`

PostRoute = Ember.Route.extend
  beforeModel: (transition) ->
    Ember.Logger.debug "---------- beforeModel ----------"
    Ember.Logger.debug transition
    Ember.Logger.debug "---------------------------------"
  model: (params, transition, queryParams) ->
    ptype = transition.params.posts.ptype
    @store.find ptype, params.pid

  # actions:
  #   commentSave: ->
  #     comment = @store.createRecord 'comment',
  #       title  : "comment tile test",
  #       comment : 'comment content test'
  #     Ember.Logger.debug "------------------------------------"
  #     Ember.Logger.debug @currentModel.get('comments').adapter
  #     Ember.Logger.debug "------------------------------------"
  #     @currentModel.get('comments').pushObject(comment).save().then (post) ->
  #       @transitionTo 'post.show', post
  #   commentCancel: ->
  #     @transitionTo 'participants.index'

`export default PostRoute`
