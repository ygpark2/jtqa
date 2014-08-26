`import Ember from "ember"`

PostEditRoute = Ember.Route.extend
  beforeModel: (transition) ->
    console.log "---------- beforeMOdel ----------"
    console.log transition
    console.log "---------------------------------"
  ,
  model: (params) ->
    @set "ptype", params.ptype
    @store.find params.ptype, params.pid
  ,
  setupController: (controller, model, trans) ->
    controller.set 'model', model
    controller.set 'ptype', trans.params['posts.edit'].ptype
  ,
  serialize: (model) ->
    console.log "--------- serialize ------------"
    console.log model.get('constructor.typeKey')
    console.log "--------------------------------"
    console.log model
    { ptype: model.get('constructor.typeKey'), pid: model.get('id') }
  ,
  actions:
    save: (params) ->
      console.log "save action called"
      console.log "=================="
      console.log params
      console.log "=================="
      @currentModel.save().then (post) ->
        console.log post
        # @transitionTo 'post.show', post
    ,
    cancel: (params) ->
      console.log "cancel action called"
      console.log "=================="
      console.log params
      console.log "=================="
      # @transitionTo 'posts.index'

`export default PostEditRoute`
