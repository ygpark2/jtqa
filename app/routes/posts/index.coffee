`import Ember from "ember"`

PostsIndexRoute = Ember.Route.extend
  model: (params) ->
    @set 'ptype', params.ptype
    @store.find params.ptype, {page: 1}
  ,
  actions:
    queryParamsDidChange: (params) ->
      console.log @get 'ptype'
      @store.find @get('ptype'), {page: params.page}
      console.log "query params changed!+=-"
      console.log params.page
      console.log "================================="
      # do some funky stuff
  ,
  setupController: (controller, model, trans) ->
    controller.set 'model', model
    controller.set 'ptype', trans.params['posts.index'].ptype
    # @controllerFor('pagination').set 'ptype', trans.params['posts.index'].ptype
    console.log "=============== setupController ==================="
    console.log controller
    console.log model
    console.log trans.params['posts.index']
    console.log "=============== setupController ==================="

`export default PostsIndexRoute`
