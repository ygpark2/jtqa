`import Ember from "ember"`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

PostsNewRoute = Ember.Route.extend AuthenticatedRouteMixin,
  beforeModel: (transition, queryParams) ->
    @_super(transition, queryParams)
    @csrf.fetchToken()
  ,
  model: (params, transition, queryParams) ->
    Ember.Logger.debug "=================================="
    Ember.Logger.debug params
    Ember.Logger.debug "=================================="
    # @store.createRecord params.ptype, { type: params.ptype }
    posts = @modelFor('posts')
    @store.createRecord posts.type.typeKey, { category: "default", views: 0, total_comments: 0 }
  ,
  serialize: (model) ->
    Ember.Logger.debug "--------- serialize ------------"
    Ember.Logger.debug model.get('constructor.typeKey')
    Ember.Logger.debug "--------------------------------"
    Ember.Logger.debug model
    { ptype: model.get('constructor.typeKey') }
  ,
  setupController: (controller, model, trans) ->
    controller.set 'model', model
    controller.set 'ptype', trans.params['posts.new'].ptype

`export default PostsNewRoute`
