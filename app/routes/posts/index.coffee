`import Ember from "ember"`

PostsIndexRoute = Ember.Route.extend
  queryParams:
    page:
      refreshModel: true,
      replace: true
    ,
    searchKey:
      refreshModel: true
    ,
    searchVal:
      refreshModel: true
  ,
  model: (params) ->
    console.log "======== model params ============"
    console.log params
    postType = params.ptype
    delete params['ptype']
    @store.find postType, params
  ,
  actions:
    queryParamsDidChange: (params) ->
      # console.log @getParentRoute()
      console.log @get 'queryParams'
      # @store.find @get('ptype'), {page: params.page}
      console.log "-----=====++++ query params changed!+++++=======-------"
      console.log params
      console.log "================================="
      @refresh params
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
