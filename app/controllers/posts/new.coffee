`import Ember from "ember"`
`import EmberValidations from 'ember-validations'`

Obj = Ember.ObjectController.extend(EmberValidations.Mixin,
  validations:
    title:
      presence: true
      length: { minimum: 5 }
    name:
      presence: true
      length: { minimum: 5 }
    email:
      presence: true
      length: { minimum: 5 }
    tags:
      presence: true
      length: { minimum: 5 }
    contents:
      presence: true

  saveText: '글쓰기'
  cancelText: '취소'
  saveAction: 'save'
  cancelAction: 'cancel'

  actions:
    submit: ->
      _this = @
      @model.set 'phone', '00000'
      @validate().then () ->
        # all validations pass
        Ember.Logger.debug "validation is passed"
        _this.get('title') # true
        _this.get('name')
        _this.get('email')
        _this.get('content')
        @model.save().then (post) ->
          _this.transitionToRoute 'post.index', post
      .catch () ->
        # any validations fail
        Ember.Logger.debug "validation is failed"
        Ember.Logger.debug _this.get('title') #  false
        Ember.Logger.debug _this.get('name')
        Ember.Logger.debug _this.get('email')
        Ember.Logger.debug _this.get('content')
        Ember.Logger.debug "--------> errors <-------------------"
        Ember.Logger.debug _this.get('errors')
      .finally () ->
        Ember.Logger.debug "is valid => " + _this.get('isValid')
        Ember.Logger.debug "validation is final step"
        # all validations complete
        # regardless of isValid state
        _this.get('title') # true || false
        _this.get('name')
        _this.get('email')
        _this.get('content')

    cancel: ->
      ptype = @get 'ptype'
      Ember.Logger.debug "================ cancel action called ==============="
      Ember.Logger.debug @model
      Ember.Logger.debug @model.type
      Ember.Logger.debug ptype
      Ember.Logger.debug "------------------------------------------------------"
      @transitionToRoute 'posts.index', ptype
)

`export default Obj`
