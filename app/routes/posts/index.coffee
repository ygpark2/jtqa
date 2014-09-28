`import Ember from "ember"`

PostsIndexRoute = Ember.Route.extend
  queryParams:
    page:
      refreshModel: true,
      replace: true
    pageSize:
      refreshModel: true
    searchKey:
      refreshModel: true
    searchVal:
      refreshModel: true
  model: (params) ->
    @modelFor('posts')
  setupController: (controller, model, trans) ->
    controller.set 'model', model
    controller.set 'ptype', model.type.typeKey
    # @controllerFor('pagination').set 'ptype', trans.params['posts.index'].ptype
    Ember.Logger.debug "=============== setupController ==================="
    Ember.Logger.debug controller
    Ember.Logger.debug model
    Ember.Logger.debug model.type.typeKey
    Ember.Logger.debug "=============== setupController ==================="
  actions:
    queryParamsDidChange: (params) ->
      # console.log @getParentRoute()
      Ember.Logger.debug @get 'queryParams'
      # @store.find @get('ptype'), {page: params.page}
      Ember.Logger.debug "-----=====++++ query params changed!+++++=======-------"
      Ember.Logger.debug params
      Ember.Logger.debug "================================="
      @refresh params

`export default PostsIndexRoute`
