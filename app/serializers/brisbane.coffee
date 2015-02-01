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

    Ember.Logger.debug "---------------------------"
    Ember.Logger.debug relationship
    Ember.Logger.debug key
    Ember.Logger.debug "---------------------------"

    relationshipType = relationship.kind

    delete json['created_at']
    delete json['updated_at']
    if relationshipType is 'hasMany'
      # or relationshipType is 'y' or relationshipType is 'manyToOne'
      # related = @getRelated(record, key)
      Ember.Logger.debug "-------> json <----------"
      Ember.Logger.debug json
      # TODO support for polymorphic manyToNone and manyToMany
      # relationships
      if key is 'comments'
        Ember.Logger.debug "This is comment key"
      else if key is 'tags'
        Ember.Logger.debug Ember.get(record, key).mapBy('name').join(",")
        # json['tag_list'] = Ember.get(record, key).mapBy('name').join(",")
      else
        @_super.apply(@, arguments)

  extractSave: (store, type, payload, id, requestType) ->

    Ember.Logger.debug "-------- payload ----------------"
    Ember.Logger.debug payload
    Ember.Logger.debug "--------- payload ---------------"
    @_super(store, type, payload, id, requestType)
    Ember.Logger.debug "--- after payload ----"

  extractMeta: (store, type, payload)->
    metadata = {}
    Em.$.each payload, (key, value)->
      Ember.Logger.debug "each ---------------------"
      Ember.Logger.debug type
      Ember.Logger.debug type.typeKey
      Ember.Logger.debug "------------------ end each"
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
