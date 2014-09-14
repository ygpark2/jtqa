`import Ember from "ember"`

PostViewRoute = Ember.Route.extend
  beforeModel: (transition) ->
    console.log "---------- beforeMOdel ----------"
    console.log transition
    console.log "---------------------------------"
  model: (params) ->
    @set "ptype", params.ptype
    @store.find params.ptype, params.pid
  setupController: (controller, model, trans) ->
    controller.set 'model', model
    controller.set 'ptype', trans.params['posts.show'].ptype
  serialize: (model) ->
    console.log "--------- serialize ------------"
    console.log model.get('constructor.typeKey')
    console.log "--------------------------------"
    console.log model
    { ptype: model.get('constructor.typeKey'), pid: model.get('id') }
  actions:
    commentSave: ->
      comment = @store.createRecord 'comment',
        title  : "comment tile test",
        comment : 'comment content test'
      Ember.Logger.debug "------------------------------------"
      Ember.Logger.debug @currentModel.get('comments').adapter
      Ember.Logger.debug "------------------------------------"
      @currentModel.get('comments').pushObject(comment).save().then (post) ->
        @transitionTo 'post.show', post
    commentCancel: ->
      @transitionTo 'participants.index'

`export default PostViewRoute`
