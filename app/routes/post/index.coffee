`import Ember from "ember"`

PostIndexRoute = Ember.Route.extend
  model: (params) ->
    @modelFor('post')
  setupController: (controller, model, transition) ->
    comment = @store.createRecord 'comment', { post: model.id }
    ptype = transition.params.posts.ptype
    controller.set 'model', model
    controller.set 'ptype', ptype
    controller.set 'comment', comment
    Ember.Logger.debug "--------- setupController ------------"
    Ember.Logger.debug model.get('comments').createRecord
    Ember.Logger.debug comment
    # Ember.Logger.debug model.type.typeKey
    Ember.Logger.debug "---------- setupController ------------"
  serialize: (model, params) ->
    Ember.Logger.debug "--------- serialize ------------"
    Ember.Logger.debug model
    # Ember.Logger.debug model.type.typeKey
    Ember.Logger.debug "--------------------------------"
    Ember.Logger.debug params
    { ptype: 'sydeny', pid: params.pid }
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
