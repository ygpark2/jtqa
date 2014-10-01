`import Ember from "ember"`

Obj = Ember.Controller.extend
  saveText: '글쓰기',
  cancelText: '취소',
  saveAction: 'save',
  cancelAction: 'cancel',

  actions:
    submit: ->
      _this = @
      @model.set 'phone', '00000'
      @model.save().then (post) ->
        _this.transitionTo 'post.index', post
    ,
    cancel: ->
      console.log "================ cancel action called ==============="
      ptype = @get 'ptype'
      console.log ptype
      console.log "------------------------------------------------------"
      @transitionTo 'posts.index', @get 'ptype'

`export default Obj`
