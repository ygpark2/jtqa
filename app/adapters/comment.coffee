`import DS from 'ember-data'`

Obj = DS.RESTAdapter.extend
  host: 'http://localhost:3000'
  namespace: 'api/v1'
  buildURL: (type, id, record) ->
    Ember.Logger.debug type
    Ember.Logger.debug id
    Ember.Logger.debug record
    return "api/v1/brisbanes/2/comments"

`export default Obj`
