`import Ember from "ember"`
`import EmberValidations from 'ember-validations'`

Obj = Ember.ObjectController.extend(EmberValidations.Mixin,

  saveText: '글쓰기'
  cancelText: '취소'
  saveAction: 'save'
  cancelAction: 'cancel'

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
    content:
      presence: true
      length: { minimum: 5 }

  actions:
    submit: ->
      _this = @
      @model.set 'phone', '00000'
      @validate().then () ->
        # all validations pass
        _this.get('title') # true
        _this.get('name')
        _this.get('email')
        _this.get('content')
        @model.save().then (post) ->
          _this.transitionToRoute 'post.index', post
      .catch () ->
        # any validations fail
        _this.get('title') #  false
        _this.get('name')
        _this.get('email')
        _this.get('content')
      .finally () ->
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
