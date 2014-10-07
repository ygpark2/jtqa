`import Ember from "ember"`

PostsRoute = Ember.Route.extend
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
    postType = params.ptype
    Ember.Logger.debug "======== posts model params ============"
    Ember.Logger.debug params
    copy_params = Ember.copy(params)
    Ember.Logger.debug "========"
    delete copy_params['ptype']
    Ember.Logger.debug "ptype => " + postType
    Ember.Logger.debug copy_params
    Ember.Logger.debug "======== posts model params ============"
    @store.find postType, copy_params
  # setupController: (controller, model, params) ->
  #   @controllerFor('posts.index').set('data', model);
  #   @_super(controller, model)
  #   console.log "=============== setupController ==================="
  #   console.log controller
  #   console.log model
  #   console.log params
  #   console.log "=============== setupController ==================="
  #   controller.set 'model', model
  #   controller.set 'data', data
  #   controller.set 'page', 1
  #   controller.set 'ptype', params.ptype
  # ,
  actions:
    queryParamsDidChange: (params) ->
      # console.log @getParentRoute()
      Ember.Logger.debug @get 'queryParams'
      # @store.find @get('ptype'), {page: params.page}
      Ember.Logger.debug "-----=====++++ query params changed!+++++=======-------"
      Ember.Logger.debug params
      Ember.Logger.debug "================================="
      @refresh params
  # renderTemplate: (controller, model) ->
  #   console.log "=============== render ==================="
  #   console.log controller
  #   console.log "=============== render ==================="
  #   @render()
  #   @render @get('postsTemplate'),
  #     controller: @get('postsIndexController')
  #     into: 'posts'

`export default PostsRoute`
