`import Ember from "ember"`

Obj = Ember.ObjectController.extend
  # content: Ember.Object.create(),
  init: ->
    @set('ptype', @get('parentController.postType'))
  ,
  ptype: null,
  isActive: (->
    Ember.Logger.debug "!!!!!!!!!!!!!! is active !!!!!!!!!!!!!!!!!!"
    Ember.Logger.debug "parentController.current " + @get('parentController.current')
    Ember.Logger.debug "content " + @get('content')
    return @get('content') == @get('parentController.current')
  ).property('content', 'parentController.current'),
  actions:
    setCurrent: ->
      postModel = @store.find @get('parentController.postType')
      postModel.reload()
      Ember.Logger.debug "--------------------------------------"
      Ember.Logger.debug @get('parentController.current')
      Ember.Logger.debug "--------------------------------------"
      Ember.Logger.debug @get('parentController')
      Ember.Logger.debug "--------------------------------------"
      Ember.Logger.debug @get('parentController.postType')
      Ember.Logger.debug "--------------------------------------"
      Ember.Logger.debug "this is current clicked !!!!!!!!!!!!!"
      @set('parentController.current', @get('content'))

`export default Obj`
