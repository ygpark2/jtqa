`import Ember from "ember"`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

PostsNewRoute = Ember.Route.extend AuthenticatedRouteMixin,
  beforeModel: (transition, queryParams) ->
    @_super(transition, queryParams)
    @csrf.fetchToken()
    unless ( @session.get('isAuthenticated') )
      @controllerFor('login').set('previousTransition', transition)
  ,
  model: (params, transition, queryParams) ->
    Ember.Logger.debug "============== model ===================="
    Ember.Logger.debug params
    Ember.Logger.debug @session.get('id')
    Ember.Logger.debug "=============== model end ==================="
    # @store.createRecord params.ptype, { type: params.ptype }
    posts = @modelFor('posts')
    @store.createRecord transition.params.posts.ptype, { category: "default", views: 0, total_comments: 0 }
  ,
  serialize: (model) ->
    Ember.Logger.debug "--------- serialize ------------"
    Ember.Logger.debug model.get('constructor.typeKey')
    Ember.Logger.debug "--------------------------------"
    Ember.Logger.debug model
    { ptype: model.get('constructor.typeKey') }
  ,
  setupController: (controller, model, transition) ->
    posts = @modelFor('posts')
    controller.set 'model', model
    controller.set 'posts', posts
    controller.set 'ptype', transition.params.posts.ptype

`export default PostsNewRoute`
