`import Ember from "ember"`

PostEditRoute = Ember.Route.extend
  beforeModel: (transition) ->
    Ember.Logger.debug "---------- beforeMOdel ----------"
    Ember.Logger.debug transition
    Ember.Logger.debug "---------------------------------"
  ,
  model: (params) ->
    @set "ptype", params.ptype
    @store.find params.ptype, params.pid
  ,
  setupController: (controller, model, trans) ->
    controller.set 'model', model
    controller.set 'ptype', trans.params['posts.edit'].ptype
    Ember.Logger.debug "================= setupController =============="
    Ember.Logger.debug model
    Ember.Logger.debug model.get('tags')
    Ember.Logger.debug [].concat(model.get('tags')).join(", ")
    Ember.Logger.debug "================= setupController =============="
  ,
  serialize: (model) ->
    Ember.Logger.debug "--------- serialize ------------"
    Ember.Logger.debug model.get('constructor.typeKey')
    Ember.Logger.debug "--------------------------------"
    Ember.Logger.debug model
    { ptype: model.get('constructor.typeKey'), pid: model.get('id') }
  ,
  actions:
    save: (params) ->
      Ember.Logger.debug "save action called"
      Ember.Logger.debug "=================="
      Ember.Logger.debug params
      Ember.Logger.debug "=================="
      @currentModel.save().then (post) ->
        Ember.Logger.debug post
        # @transitionTo 'post.show', post
    ,
    cancel: (params) ->
      Ember.Logger.debug "cancel action called"
      Ember.Logger.debug "=================="
      Ember.Logger.debug params
      Ember.Logger.debug "=================="
      # @transitionTo 'posts.index'

`export default PostEditRoute`
