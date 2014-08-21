`import Ember from "ember"`

PostsIndexRoute = Ember.Route.extend
  model: (params) ->
    @store.find params.ptype
  ,
  actions:
    queryParamsDidChange: (params) ->
      console.log "query params changed!+=-"
      console.log params
      console.log "================================="
      # do some funky stuff
  ,
  setupController: (controller, model, trans) ->
    controller.set 'ptype', trans.params['posts.index'].ptype
    @controllerFor('pagination').set 'ptype', trans.params['posts.index'].ptype
    console.log "=============== setupController ==================="
    console.log controller
    console.log model
    console.log trans.params['posts.index']
    console.log "=============== setupController ==================="

`export default PostsIndexRoute`
