`import Ember from "ember"`

Obj = Ember.Controller.extend
  init: ->
    Ember.Logger.debug "--------------------------------------"
    Ember.Logger.debug Ember.computed.alias('model.tags')
    Ember.Logger.debug "--------------------------------------"
    # @get('model.tags').forEach (item, index, enumerable) ->
    #   tags.push item.get('name')
    #   tag_names += item.get('name') + ", "
    # @set "tag_list", tag_names
    # Ember.computed.mapBy('model.tags', 'name').forEach (item, index, enumerable) ->
    #   Ember.Logger.debug item
  tag_list: (->
    console.log "-----------------------------------------------"
    # console.log @get('model.tags').mapBy('name').uniq().toArray().join(", ")
    # @get('model.tags').forEach (item, index, enumerable) ->
    #   console.log item.get('name') + ", "
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
        _this.transitionToRoute 'posts.show', post
    ,
    cancel: ->
      Ember.Logger.debug "================ cancel action called ==============="
      Ember.Logger.debug ptype
      Ember.Logger.debug "------------------------------------------------------"
      ptype = @get 'ptype'
      @transitionTo 'posts.index', @get 'ptype'

`export default Obj`
