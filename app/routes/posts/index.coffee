`import Ember from "ember"`
`import RouteMixin from "ember-cli-pagination/remote/route-mixin"`

PostsIndexRoute = Ember.Route.extend RouteMixin,
  # perPage: 20,
  beforeModel: (transition, queryParams)->
    @csrf.fetchToken()
  model: (params, transition, queryParams) ->
    Ember.Logger.debug transition.params
    Ember.Logger.debug "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    # @modelFor('posts')
    @findPaged('brisbane',params)
  setupController: (controller, model, transition) ->
    Ember.Logger.debug "xxxxxxxxxxxxx Setup Controller xxxxxxxxxxxxxxxxxx"
    Ember.Logger.debug transition.params
    controller.set 'model', model
    controller.set 'ptype', transition.params.posts.ptype

`export default PostsIndexRoute`
