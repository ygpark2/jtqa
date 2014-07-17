`import Ember from "ember"`

PostNewRoute = Ember.Route.extend
  model: (params) ->
    console.log "=================================="
    console.log params.ptype
    console.log "=================================="
    @store.createRecord 'post'

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

`export default PostNewRoute`
