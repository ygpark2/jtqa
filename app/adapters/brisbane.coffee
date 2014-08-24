`import DS from 'ember-data'`

Obj = DS.RESTAdapter.extend
  host: 'http://localhost:3000'
  namespace: 'api/v1'

`export default Obj`
