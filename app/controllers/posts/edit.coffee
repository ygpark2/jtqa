`import Ember from "ember"`

Obj = Ember.Controller.extend
  saveText: '수정 하기',
  cancelText: '취소',
  saveAction: 'save',
  cancelAction: 'cancel',

  actions:
    submit: ->
      console.log @model
      _this = @
      @model.save().then (post) ->
        console.log post
        _this.transitionTo 'posts.show', post
    ,
    cancel: ->
      console.log "================ cancel action called ==============="
      ptype = @get 'ptype'
      console.log ptype
      console.log "------------------------------------------------------"
      @transitionTo 'posts.index', @get 'ptype'

`export default Obj`
