`import DS from 'ember-data'`

Obj = DS.RESTAdapter.extend
  host: 'http://localhost:3000'
  namespace: 'api/v1'
  # pathForType: (type) ->
  #   decamelized = Ember.String.decamelize(type)
  #   Ember.Logger.debug "======== pathForType ==========="
  #   Ember.Logger.debug decamelized
  #   "brisbane/" + Ember.String.pluralize(decamelized)

  buildURL: (type, id, record) ->
    decamelized = Ember.String.decamelize(type)
    Ember.Logger.debug "======== buildURL ==========="
    Ember.Logger.debug type
    Ember.Logger.debug id
    Ember.Logger.debug record
    Ember.Logger.debug record._relationships
    klass_name = record.klass
    klass_id = "0"
    Ember.keys(record._relationships).forEach (key) ->
      unless Ember.none(record._relationships[key].inverseRecord)
        klass_name = key.replace(/Post/g, "")
        klass_id = record._relationships[key].inverseRecord.get('id')
        Ember.Logger.debug "xxxxxxxxxxxxxxxxxxx-------------->"
    Ember.Logger.debug "======== buildURL ==========="
    @get('host') + "/" + @get('namespace') + "/" + klass_name + "/" + klass_id + "/" + Ember.String.pluralize(decamelized)

`export default Obj`
