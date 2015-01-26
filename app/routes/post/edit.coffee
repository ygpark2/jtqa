`import Ember from "ember"`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

PostEditRoute = Ember.Route.extend AuthenticatedRouteMixin,
  beforeModel: (transition, queryParams) ->
    @_super(transition, queryParams)
    @csrf.fetchToken()
  ,
  model: (params) ->
    @modelFor('post')
  ,
  setupController: (controller, model, transition) ->
    ptype = transition.params.posts.ptype
    controller.set 'model', model
    controller.set 'ptype', ptype
    Ember.Logger.debug "================= setupController =============="
    Ember.Logger.debug model
    Ember.Logger.debug model.get('tags')
    Ember.Logger.debug [].concat(model.get('tags')).join(", ")
    Ember.Logger.debug "================= setupController =============="
  ,
  serialize: (model) ->
    Ember.Logger.debug "--------- serialize ------------"
    Ember.Logger.debug model.type.typeKey
    Ember.Logger.debug "--------------------------------"
    Ember.Logger.debug model
    { ptype: model.type.typeKey, pid: model.get('id') }

`export default PostEditRoute`
