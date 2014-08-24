`import Ember from "ember"`

PostNewRoute = Ember.Route.extend
  model: (params, transition) ->
    console.log "=================================="
    console.log params
    console.log "=================================="
    # @store.createRecord params.ptype, { type: params.ptype }
    @store.createRecord params.ptype, { category: "default", views: 0, total_comments: 0 }
  ,
  actions:
    save: (params, transition) ->
      console.log "save action called"
      console.log "=================="
      console.log params
      console.log "=================="
      @currentModel.save().then (post) ->
        console.log post
        # @transitionTo 'post.show', post
    ,
    cancel: (params, transition) ->
      console.log "cancel action called"
      console.log "=================="
      console.log params
      console.log "=================="
      # @transitionTo 'posts.index'

`export default PostNewRoute`
