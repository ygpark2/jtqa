`import Ember from "ember"`

Obj = Ember.Controller.extend
  init: ->
    Ember.Logger.debug "--------------------------------------"
    Ember.Logger.debug Ember.computed.alias('model.tags')
    Ember.Logger.debug "--------------------------------------"

  tag_list: (->
    console.log "-------------------- tag list ---------------------------"
    # console.log @get('model.tags').mapBy('name').uniq().toArray().join(", ")
    @get('model.tags').mapBy('name').uniq().toArray().join(", ")
  ).property('model.tags')

  saveText: '수정 하기'
  cancelText: '취소'
  saveAction: 'save'
  cancelAction: 'cancel'

  actions:
    submit: ->
      _this = @
      @model.set 'tag_list', @get('tag_list')
      @model.save().then (post) ->
        Ember.Logger.debug "+++++++++++++++++++++++++++"
        Ember.Logger.debug post
        Ember.Logger.debug "+++++++++++++++++++++++++++"
        _this.transitionToRoute 'post.index', post
    ,
    cancel: ->
      Ember.Logger.debug "================ cancel action called ==============="
      Ember.Logger.debug ptype
      Ember.Logger.debug "------------------------------------------------------"
      ptype = @get 'ptype'
      @transitionTo 'post.index', @get 'model'

`export default Obj`
