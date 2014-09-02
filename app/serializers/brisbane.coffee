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

  serializeHasMany: (record, json, relationship) ->
    key = relationship.key

    relationshipType = DS.RelationshipChange.determineRelationshipType(record.constructor, relationship)

    # http://stackoverflow.com/questions/21976329/serialising-async-hasmany-relationships
    if (relationshipType == 'manyToNone' || relationshipType == 'manyToMany' || relationshipType == 'manyToOne')
        json[key] = Ember.get(record, key).mapBy('id')
        Ember.Logger.debug "-------> json <----------"
        Ember.Logger.debug json
        # TODO support for polymorphic manyToNone and manyToMany
        # relationships
    ###
    if (key == 'comments')
      Ember.Logger.debug "This is comment key"
    else if key == 'tags'
      Ember.Logger.debug "This is tag key"
    else
      @_super.apply(this, arguments)
    ###

  extractSave: (store, type, payload, id, requestType) ->

    Ember.Logger.debug "-------- payload ----------------"
    Ember.Logger.debug payload
    Ember.Logger.debug "--------- payload ---------------"
    @_super(store, type, payload, id, requestType)

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