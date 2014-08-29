`import DS from 'ember-data'`
`import Ember from "ember"`

decamelize = Ember.String.decamelize
capitalize = Ember.String.capitalize
camelize = Ember.String.camelize
forEach = Ember.EnumerableUtils.forEach
underscore = Ember.String.underscore

Obj = DS.RESTSerializer.extend DS.EmbeddedRecordsMixin,
  init: ->
    @_super()

  attrs:
    tags: embedded: 'always'
    comments: embedded: 'always'

  extractMeta: (store, type, payload)->
    metadata = {}
    Em.$.each payload, (key, value)->
      if (key != type.typeKey && key != type.typeKey.pluralize())
        metadata[key] = value
        delete payload[key]
    store.metaForType(type, metadata)

  keyForAttribute: (attr)->
    decamelize(attr)

  keyForRelationship: (key, kind)->
    key = key.decamelize()
    if (kind is "belongsTo")
      key + "_id"
    else if (kind is "hasMany")
      key.singularize() + "_ids"
    else
      key

`export default Obj`