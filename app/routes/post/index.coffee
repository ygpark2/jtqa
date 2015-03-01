`import Ember from "ember"`

PostIndexRoute = Ember.Route.extend
  beforeModel: (transition, queryParams)->
    @csrf.fetchToken()
  model: (params, transition, queryParams) ->
    @modelFor('post').reload()
  afterModel: (post, transition) ->
    view_cnt = post.get('views')
    # post.set('views', view_cnt + 1)
    # post.save().then (post) ->
    #   Ember.Logger.debug "view count increased"
  setupController: (controller, model, transition) ->
    ptype = transition.params.posts.ptype

    comment = @store.createRecord 'comment', {klass: ptype}
    controller.set 'comment', comment
    controller.set 'model', model
    controller.set 'ptype', ptype

  serialize: (model, params) ->
    { ptype: model.type.typeKey, pid: params.pid }

  actions:
    commentSave: ->
      _this = @
      comment = @controller.get 'comment'
      ptype = @controller.get 'ptype'
      @currentModel.get('comments').pushObject(comment).save().then (post) ->
        comment_cnt = post.get('total_comments')
        post.set('total_comments', comment_cnt + 1)
        _this.controller.set 'comment', _this.store.createRecord 'comment', {klass: ptype}
        _this.refresh()
    commentCancel: ->
      @transitionTo 'posts.index'

`export default PostIndexRoute`
