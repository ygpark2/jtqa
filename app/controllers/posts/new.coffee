`import Ember from "ember"`
`import EmberValidations from 'ember-validations'`

Obj = Ember.ObjectController.extend EmberValidations.Mixin,
  init: ->
    @_super()
    Ember.Logger.debug "--------------------------------------"
    Ember.Logger.debug " ---==========---> init <--=========----"
    Ember.Logger.debug @form_errors
    Ember.Logger.debug "--------------------------------------"

  form_errors = {}
  saveText: '글쓰기'
  cancelText: '취소'
  saveAction: 'save'
  cancelAction: 'cancel'

  validations:
    title:
      presence: true
      length: { minimum: 5, maximum: 10 }
    name:
      presence: true
      length: { minimum: 5 }
    email:
      presence: true
      length: { minimum: 5 }
    tag_list:
      presence: true
      length: { minimum: 5 }
    content:
      presence: true

  ###
  titleValidation: (->
    Ember.Logger.debug "title is validation call!!!"
    # @validate()
  ).observes('title')

  nameValidation: (->
    Ember.Logger.debug "name validation call!!!"
    # @validate()
  ).observes('name')

  emailValidation: (->
    Ember.Logger.debug "email validation call!!!"
    # @validate()
  ).observes('email')

  tagListValidation: (->
    Ember.Logger.debug "tag_list validation call!!!"
    # @validate()
  ).observes('tag_list')

  contentValidation: (->
    Ember.Logger.debug "content validation call!!!"
    # @validate()
  ).observes('content')
  ###

  actions:
    validate: () ->
      Ember.Logger.debug "---------- validate ??????? ---------------"
      _this = @
      @set('form_errors', @get('errors'))
      @validate().then () ->
        Ember.Logger.debug _this.get('isValid')
        # enable submit button
      .catch () ->
        # any validations fail
        Ember.Logger.debug "= any validations fail ="
        Ember.Logger.debug _this.get('isValid')
      .finally () ->
        Ember.Logger.debug _this.get('isValid')
        Ember.Logger.debug _this.get('errors')

    submit: ->
      _this = @

      @model.set 'phone', '00000'
      @get('posts').pushObject(@model).save().then (post) ->
        _this.transitionToRoute 'posts.index', _this.get('posts')

    cancel: ->
      ptype = @get 'ptype'
      Ember.Logger.debug "================ cancel action called ==============="
      Ember.Logger.debug @model
      Ember.Logger.debug @model.type
      Ember.Logger.debug ptype
      Ember.Logger.debug "------------------------------------------------------"
      @transitionToRoute 'posts.index', ptype

`export default Obj`
