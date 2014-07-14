`import Ember from "ember"`

Obj = Ember.Component.extend
  classNames: ['pretty-color'],
  attributeBindings: ['style'],
  style: ->
    return 'color: ' + @get('name') + ';'.property('name')

`export default Obj`