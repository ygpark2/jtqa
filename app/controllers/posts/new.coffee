`import Ember from "ember"`

Obj = Ember.ObjectController.extend Ember.Validations.Mixin
  saveText: '글쓰기',
  cancelText: '취소',
  saveAction: 'save',
  cancelAction: 'cancel',

  actions:
    submit: ->
      _this = @
      @model.set 'phone', '00000'
      @model.save().then (post) ->
        _this.transitionToRoute 'post.index', post
    ,
    cancel: ->
      console.log "================ cancel action called ==============="
      ptype = @get 'ptype'
      console.log ptype
      console.log "------------------------------------------------------"
      transitionToRoute 'posts.index', @get 'ptype'

Obj.reopen
  validations:
    title:
      presence: true
      length: { minimum: 5 }
    content:
      presence: true
      length: { minimum: 5 }

`export default Obj`
