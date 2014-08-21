`import Ember from "ember"`

Obj = Ember.ObjectController.extend
  # content: Ember.Object.create(),
  init: ->
    @set('ptype', @get('parentController.postType'))
  ,
  ptype: null,
  isActive: (->
    console.log "is active!!!!!!!!!!!!!!!!!!"
    @get('content') == @get('parentController.current')
  ).property('content', 'parentController.current'),
  actions:
    setCurrent: ->
      postModel = @store.find @get('parentController.postType')
      postModel.reload()
      console.log "--------------------------------------"
      console.log @get('parentController.current')
      console.log "--------------------------------------"
      console.log @get('parentController')
      console.log "--------------------------------------"
      console.log @get('parentController.postType')
      console.log "--------------------------------------"
      console.log "this is current clicked !!!!!!!!!!!!!"
      @set('parentController.current', @get('content'))

`export default Obj`
