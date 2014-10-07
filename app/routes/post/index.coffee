`import Ember from "ember"`

PostIndexRoute = Ember.Route.extend
  model: (params) ->
    @modelFor('post')
  setupController: (controller, model, transition) ->
    ptype = transition.params.posts.ptype

    comment = @store.createRecord 'comment', {post: model}
    controller.set 'comment', comment

    controller.set 'model', model
    controller.set 'ptype', ptype

    Ember.Logger.debug "--------- setupController ------------"
    # Ember.Logger.debug model.get('comments').createRecord
    # Ember.Logger.debug comment
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
      comment = @controller.get 'comment'
      Ember.Logger.debug "--------------- commentSave ---------------------"
      Ember.Logger.debug @controller.get('model').id
      Ember.Logger.debug "---------------- commentSave --------------------"
      @currentModel.get('comments').pushObject(comment).save().then (post) ->
        @transitionTo 'post.index', post
    commentCancel: ->
      @transitionTo 'participants.index'

`export default PostIndexRoute`
