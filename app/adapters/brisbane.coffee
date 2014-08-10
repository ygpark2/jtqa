`import DS from 'ember-data'`

Obj = DS.RESTAdapter.extend
  host: 'http://localhost:4200'
  namespace: 'api/v1'

`export default Obj`
