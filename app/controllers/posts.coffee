`import Ember from "ember"`
# `import paginationController from "./pagination"`

Obj = Ember.ArrayController.extend # paginationController
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
