`import Ember from "ember"`

PostNewRoute = Ember.Route.extend
  model: (params, transition, queryParams) ->
    Ember.Logger.debug "=================================="
    Ember.Logger.debug params
    Ember.Logger.debug "=================================="
    # @store.createRecord params.ptype, { type: params.ptype }
    @store.createRecord params.ptype, { category: "default", views: 0, total_comments: 0 }
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
  ,
  actions:
    save: ->
      @currentModel.save().then (post) ->
        @transitionTo 'post.show', post
    ,
    cancel: ->
      Ember.Logger.debug "========================"
      Ember.Logger.debug @currentModel
      Ember.Logger.debug @currentModel.get('constructor.typeKey')
      Ember.Logger.debug "========================"
      # @transitionTo 'posts.index', @currentModel.get('constructor.typeKey')

`export default PostNewRoute`
