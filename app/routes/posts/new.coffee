`import Ember from "ember"`

PostNewRoute = Ember.Route.extend
  model: (params, transition, queryParams) ->
    console.log "=================================="
    console.log params
    console.log "=================================="
    # @store.createRecord params.ptype, { type: params.ptype }
    @store.createRecord params.ptype, { category: "default", views: 0, total_comments: 0 }
  ,
  serialize: (model) ->
    console.log "--------- serialize ------------"
    console.log model.get('constructor.typeKey')
    console.log "--------------------------------"
    console.log model
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
      console.log "========================"
      console.log @currentModel
      console.log @currentModel.get('constructor.typeKey')
      console.log "========================"
      # @transitionTo 'posts.index', @currentModel.get('constructor.typeKey')

`export default PostNewRoute`
