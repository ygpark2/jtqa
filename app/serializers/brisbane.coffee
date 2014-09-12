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

    delete json['created_at']
    delete json['updated_at']
    if relationshipType is 'manyToNone' or relationshipType is 'manyToMany' or relationshipType is 'manyToOne'
      related = @getRelated(record, key)
      Ember.Logger.debug "-------> json <----------"
      Ember.Logger.debug json
      # TODO support for polymorphic manyToNone and manyToMany
      # relationships
      if key is 'comments'
        Ember.Logger.debug "This is comment key"
      else if key is 'tags'
        # json['tag_list'] = Ember.get(record, key).mapBy('name').join(",")
      else
        @_super.apply(@, arguments)

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