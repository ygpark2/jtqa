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
    Ember.Logger.debug "======== posts model params ============"
    Ember.Logger.debug params
    postType = params.ptype
    delete params['ptype']
    @store.find postType, params
  # setupController: (controller, model, params) ->
  #   @controllerFor('posts.index').set('data', model);
  #   @_super(controller, model)
  #   data = [{ title: "Harry Potter", price: 12.99}, {title: "Song Of Ice", price: 19.99}, {title: "Name Of The Wind",price: 10.99}, {title: "Redemption Ark",price: 21.99}]
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
