`import Ember from "ember"`

PostsIndexRoute = Ember.Route.extend
  controllerName: 'posts',
  model: (params, transition) ->
    console.log "=============== posts ==================="
    console.log params
    console.log "=============== posts ==================="
    @store.find params.ptype

`export default PostsIndexRoute`
