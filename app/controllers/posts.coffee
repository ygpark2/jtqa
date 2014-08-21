`import Ember from "ember"`

Obj = Ember.ArrayController.extend
#  needs: ['pagination'],
#  content: {},
#  pageSize: 4,
#  ptype: null,
#  queryParams: ['page', 'ptype'],
  currentPathDidChange: (->
    path = @get('currentPath')
    console.log 'path changed to: ' + path
  ).observes('currentPath')

`export default Obj`
