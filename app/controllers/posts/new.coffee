`import Ember from "ember"`

Obj = Ember.Controller.extend
  saveText: '글쓰기',
  cancelText: '취소',
  saveAction: 'save',
  cancelAction: 'cancel',

  actions:
    submit: ->
      console.log @model
      _this = @
      @model.set 'phone', '00000'
      @model.save().then (post) ->
        console.log post
        _this.transitionToRoute 'post.index', post
    ,
    cancel: ->
      console.log "================ cancel action called ==============="
      ptype = @get 'ptype'
      console.log ptype
      console.log "------------------------------------------------------"
      transitionToRoute 'posts.index', @get 'ptype'

`export default Obj`
