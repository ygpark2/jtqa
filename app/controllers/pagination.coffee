`import Ember from "ember"`

Obj = Ember.ObjectController.extend
  content: Ember.Object.create(),
  ptype: 'brisbane',
  isActive: (->
    return @get('content') == @get('parentController.current')
  ).property('content', 'parentController.current'),
  actions:
    setCurrent: ->
      console.log "this is current clicked !!!!!!!!!!!!!"
      @set('parentController.current', @get('content'))

`export default Obj`
