`import Ember from "ember"`

PostIndexRoute = Ember.Route.extend
  model: (params) ->
    @modelFor('post')
  setupController: (controller, model, trans) ->
    controller.set 'model', model
    controller.set 'ptype', model.type.typeKey
  serialize: (model, params) ->
    Ember.Logger.debug "--------- serialize ------------"
    Ember.Logger.debug model
    Ember.Logger.debug "--------------------------------"
    Ember.Logger.debug params
    { ptype: 'brisbane', pid: params.pid }
  actions:
    commentSave: ->
      comment = @store.createRecord 'comment',
        title  : "comment tile test",
        comment : 'comment content test'
      Ember.Logger.debug "------------------------------------"
      Ember.Logger.debug @currentModel.get('comments').adapter
      Ember.Logger.debug "------------------------------------"
      @currentModel.get('comments').pushObject(comment).save().then (post) ->
        @transitionTo 'post.index', post
    commentCancel: ->
      @transitionTo 'participants.index'

`export default PostIndexRoute`
