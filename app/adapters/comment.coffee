`import DS from 'ember-data'`

Obj = DS.RESTAdapter.extend
  host: 'http://localhost:3000'
  namespace: 'api/v1'
  # pathForType: (type) ->
  #   decamelized = Ember.String.decamelize(type)
  #   Ember.Logger.debug "======== pathForType ==========="
  #   Ember.Logger.debug decamelized
  #   "brisbanes/" + Ember.String.pluralize(decamelized)

  # buildURL: (type, id, record) ->
  #   Ember.Logger.debug "======== buildURL ==========="
  #   Ember.Logger.debug type
  #   Ember.Logger.debug id
  #   Ember.Logger.debug record
  #   Ember.Logger.debug "======== buildURL ==========="
  #   return "api/v1/brisbanes/2/comments"

`export default Obj`
