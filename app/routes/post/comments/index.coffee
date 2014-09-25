`import Ember from "ember"`

CommentsIndexRoute = Ember.Route.extend
  queryParams:
    page:
      refreshModel: true,
      replace: true
    ,
    pageSize:
      refreshModel: true,
    ,
    searchKey:
      refreshModel: true
    ,
    searchVal:
      refreshModel: true
  ,
  model: (params) ->
    Ember.Logger.debug "======== comment model params ============"
    Ember.Logger.debug params
    postType = params.ptype
    delete params['ptype']
    @store.find postType, params

  actions:
    queryParamsDidChange: (params) ->
      # console.log @getParentRoute()
      Ember.Logger.debug @get 'queryParams'
      # @store.find @get('ptype'), {page: params.page}
      Ember.Logger.debug "-----=====++++ query params changed!+++++=======-------"
      Ember.Logger.debug params
      Ember.Logger.debug "================================="
      @refresh params
      # do some funky stuff

  setupController: (controller, model, trans) ->
    controller.set 'model', model.comments
    controller.set 'ptype', trans.params['posts.index'].ptype
    # @controllerFor('pagination').set 'ptype', trans.params['posts.index'].ptype
    Ember.Logger.debug "=============== setupController For Comment ==================="
    Ember.Logger.debug controller
    Ember.Logger.debug model
    Ember.Logger.debug trans.params['posts.index']
    Ember.Logger.debug "=============== setupController For Comment ==================="

`export default CommentsIndexRoute`
