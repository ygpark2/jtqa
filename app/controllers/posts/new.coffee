`import Ember from "ember"`

Obj = Ember.ObjectController.extend
  init: ->
    @_super()
    Ember.Logger.debug "--------------------------------------"
    Ember.Logger.debug "--------------------------------------"

  saveText: '글쓰기'
  cancelText: '취소'
  saveAction: 'save'
  cancelAction: 'cancel'

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

  actions:
    submit: ->
      _this = @
      @model.validate().then () ->
        # all validations pass
        Ember.Logger.debug "validation is passed"
        _this.model.set 'phone', '00000'
        _this.model.save().then (post) ->
          _this.transitionToRoute 'post.index', post
      .catch () ->
        # any validations fail
        Ember.Logger.debug "validation is failed"
        Ember.Logger.debug "--------> errors <-------------------"
        Ember.Logger.debug _this.model.get('isValid')
        Ember.Logger.debug _this.model.get('errors')
      .finally () ->
        Ember.Logger.debug "is valid => " + _this.model.get('isValid')
        Ember.Logger.debug "validation is final step"
        # _this.set('errors', null)

    cancel: ->
      ptype = @get 'ptype'
      Ember.Logger.debug "================ cancel action called ==============="
      Ember.Logger.debug @model
      Ember.Logger.debug @model.type
      Ember.Logger.debug ptype
      Ember.Logger.debug "------------------------------------------------------"
      @transitionToRoute 'posts.index', ptype

`export default Obj`
