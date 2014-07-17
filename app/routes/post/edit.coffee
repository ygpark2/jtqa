`import Ember from "ember"`

PostEditRoute = Ember.Route.extend
  model: ->
    @store.find 'post'

  actions:
    save: (params) ->
      console.log "save action called"
      console.log "=================="
      console.log params
      console.log "=================="
      @currentModel.save().then (post) ->
        console.log post
        # @transitionTo 'post.show', post

    cancel: (params) ->
      console.log "cancel action called"
      console.log "=================="
      console.log params
      console.log "=================="
      # @transitionTo 'posts.index'

`export default PostEditRoute`
