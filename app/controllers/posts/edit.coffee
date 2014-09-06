`import Ember from "ember"`

Obj = Ember.Controller.extend
  init: ->
    Ember.Logger.debug "--------------------------------------"
    Ember.Logger.debug Ember.computed.alias('model.tags')
    Ember.Logger.debug "--------------------------------------"
    tag_names = ""
    tags = @get('tags')
    # @get('model.tags').forEach (item, index, enumerable) ->
    #   tags.push item.get('name')
    #   tag_names += item.get('name') + ", "
    # @set "tag_list", tag_names
    # Ember.computed.mapBy('model.tags', 'name').forEach (item, index, enumerable) ->
    #   Ember.Logger.debug item
  tags: []
  tag_array: Ember.computed.mapBy('model.tags', 'name')
  tag_list: Ember.computed.uniq('tag_array')
  observeTagList: (->
    console.log "---------------------------"
    console.log @get("tag_list")
    console.log "---------------------------"
  ).observes('tag_list')
  saveText: '수정 하기'
  cancelText: '취소'
  saveAction: 'save'
  cancelAction: 'cancel'

  actions:
    submit: ->
      Ember.Logger.debug @model
      Ember.Logger.debug @model.tags
      Ember.Logger.debug "-----------------------------------------"
      @get('tags').forEach (item, index, enumerable) ->
        Ember.Logger.debug item
      @store.unloadAll('tag')
      tag_list = @get('tag_list').split(",")
      tag_list.forEach (item, index, enumerable) ->
        @store.createRecord 'tag', {'name': item, taggings_count: 1 }
      #@model.get('tags').forEach (item, index, enumerable) ->
      #  if tag_list.indexOf(item.get('name')) < 0
      #    @store.createRecord('tag', {
      #  else
      #    item.destroyRecord()
      #  Ember.Logger.debug item.get('name')
      _this = @
      # Ember.Logger.debug "tag list => " + @get 'tag_list'
      # @model.save().then (post) ->
      #   Ember.Logger.debug post
      #   _this.transitionToRoute 'posts.show', post
    ,
    cancel: ->
      Ember.Logger.debug "================ cancel action called ==============="
      Ember.Logger.debug ptype
      Ember.Logger.debug "------------------------------------------------------"
      ptype = @get 'ptype'
      @transitionTo 'posts.index', @get 'ptype'

`export default Obj`
