`import Ember from "ember"`

Obj = Ember.Controller.extend
  init: ->
    Ember.Logger.debug "--------------------------------------"
    Ember.Logger.debug Ember.computed.alias('model.tags')
    Ember.Logger.debug "--------------------------------------"

  saveText: '수정 하기'
  cancelText: '취소'
  saveAction: 'save'
  cancelAction: 'cancel'

  actions:
    submit: ->
      _this = @
      @model.save().then (post) ->
        Ember.Logger.debug "+++++++++++++++++++++++++++"
        Ember.Logger.debug post
        Ember.Logger.debug "+++++++++++++++++++++++++++"
        _this.transitionToRoute 'post.index', post
    cancel: ->
      ptype = @get('ptype')
      @transitionTo 'post.index', @get('model')

`export default Obj`
