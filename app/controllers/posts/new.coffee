`import Ember from "ember"`
Validations = Ember.Validations.Mixin

Obj = Ember.ObjectController.extend(Validations,

  saveText: '글쓰기',
  cancelText: '취소',
  saveAction: 'save',
  cancelAction: 'cancel',

  validations:
    title:
      presence: true
      length: { minimum: 5 }
    content:
      presence: true
      length: { minimum: 5 }

  actions:
    submit: ->
      _this = @
      @model.set 'phone', '00000'
      @model.save().then (post) ->
        _this.transitionToRoute 'post.index', post
    ,
    cancel: ->
      Ember.Logger.debug "================ cancel action called ==============="
      ptype = @get 'ptype'
      Ember.Logger.debug ptype
      Ember.Logger.debug "------------------------------------------------------"
      transitionToRoute 'posts.index', @get 'ptype'
)

`export default Obj`
