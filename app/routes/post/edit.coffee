PostEditRoute = Ember.Route.extend
  model: ->
    @store.find 'post'

  actions:
    save: (params) ->
      console.log "save action called"
      @currentModel.save().then (post) ->
        console.log post
        # @transitionTo 'post.show', post

    cancel: (params) ->
      console.log "cancel action called"
      # @transitionTo 'posts.index'

`export default PostEditRoute`
