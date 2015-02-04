`import Ember from "ember"`

PostsIndexRoute = Ember.Route.extend
  beforeModel: (transition, queryParams)->
    @csrf.fetchToken()
  model: (params, transition, queryParams) ->
    Ember.Logger.debug transition.resolvedModels.posts.query.page
    Ember.Logger.debug params
    Ember.Logger.debug transition.params
    Ember.Logger.debug "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    @modelFor('posts').reload()
  setupController: (controller, model, trans) ->
    controller.set 'model', model
    controller.set 'ptype', model.type.typeKey
    # @controllerFor('pagination').set 'ptype', trans.params['posts.index'].ptype
    Ember.Logger.debug "=============== setupController ==================="
    Ember.Logger.debug controller
    Ember.Logger.debug model
    Ember.Logger.debug model.type.typeKey
    Ember.Logger.debug "=============== setupController ==================="

`export default PostsIndexRoute`
