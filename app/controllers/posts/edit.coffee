`import Ember from "ember"`

Obj = Ember.Controller.extend
  init: ->
    Ember.Logger.debug "--------------------------------------"
    Ember.Logger.debug Ember.computed.alias('model.tags')
    Ember.Logger.debug "--------------------------------------"
  tag_list: Ember.computed.mapBy('model.tags', 'name')
  saveText: '수정 하기',
  cancelText: '취소',
  saveAction: 'save',
  cancelAction: 'cancel',

  actions:
    submit: ->
      Ember.Logger.debug @model
      _this = @
      @model.save().then (post) ->
        Ember.Logger.debug post
        _this.transitionTo 'posts.show', post
    ,
    cancel: ->
      Ember.Logger.debug "================ cancel action called ==============="
      Ember.Logger.debug ptype
      Ember.Logger.debug "------------------------------------------------------"
      ptype = @get 'ptype'
      @transitionTo 'posts.index', @get 'ptype'

`export default Obj`
