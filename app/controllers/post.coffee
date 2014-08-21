`import Ember from "ember"`

Obj = Ember.ObjectController.extend
  needs: ['pagination'],
  content: {},
  pageSize: 4,
  ptype: null,
  queryParams: ['page', 'ptype']

`export default Obj`
