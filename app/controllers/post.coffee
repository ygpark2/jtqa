`import Ember from "ember"`

Obj = Ember.ObjectController.extend
  needs: ['pagination'],
  content: {},
  ptype: null,
  actions:
    save: ->
      @get('model').save()
    ,
    deleteRecord: ->
      @get('model').deleteRecord()
      @get('model').save()

`export default Obj`
