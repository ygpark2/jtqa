`import Ember from "ember"`

PostIndexRoute = Ember.Route.extend
  model: (params) ->
    @modelFor('post')
  setupController: (controller, model, transition) ->
    ptype = transition.params.posts.ptype

    Ember.Logger.debug "======= model loaded !!!! ====="
    comment = model.store.createRecord 'comment' # , {post: @store.getById(ptype, 3)}
    # comment.get('post').pushObject(model)

    controller.set 'model', model
    controller.set 'ptype', ptype
    controller.set 'comment', comment
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
      # comment = @store.createRecord 'comment',
      #   title: "comment tile test",
      #   comment: 'comment content test',
      #   post: 3 # @controller.get('model')
      Ember.Logger.debug "--------------- commentSave ---------------------"
      Ember.Logger.debug @currentModel.get('comments').adapter
      Ember.Logger.debug @currentModel.adapter
      Ember.Logger.debug @store.adapterFor('comment')
      Ember.Logger.debug comment.store
      Ember.Logger.debug comment.store.get 'adapter'
      Ember.Logger.debug @controller.get('model').id
      Ember.Logger.debug "---------------- commentSave --------------------"
      @currentModel.get('comments').pushObject(comment).save().then (post) ->
        @transitionTo 'post.index', post
    commentCancel: ->
      @transitionTo 'participants.index'

`export default PostIndexRoute`
