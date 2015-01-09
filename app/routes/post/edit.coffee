`import Ember from "ember"`

PostEditRoute = Ember.Route.extend
  beforeModel: (transition) ->
    Ember.Logger.debug "---------- beforeMOdel ----------"
    Ember.Logger.debug transition
    Ember.Logger.debug "---------------------------------"
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
