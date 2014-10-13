`import Ember from "ember"`

PostEditRoute = Ember.Route.extend
  beforeModel: (transition) ->
    Ember.Logger.debug "---------- beforeMOdel ----------"
    Ember.Logger.debug transition
    Ember.Logger.debug "---------------------------------"
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
  ,
  actions:
    save: (params) ->
      Ember.Logger.debug "save action called"
      Ember.Logger.debug "=================="
      Ember.Logger.debug params
      Ember.Logger.debug "=================="
      @currentModel.save().then (post) ->
        Ember.Logger.debug " ((((( post is saved ))))) "
        Ember.Logger.debug post
        transitionToRoute 'post.index', post
    ,
    cancel: (params) ->
      Ember.Logger.debug "cancel action called"
      Ember.Logger.debug "=================="
      Ember.Logger.debug params
      Ember.Logger.debug "=================="
      transitionToRoute 'post.index', @currentModel

`export default PostEditRoute`
