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
  # attrs:
  #   post:
  #     embedded: 'always'
  serializeBelongsTo: (record, json, relationship) ->
    key = relationship.key

    belongsTo = Ember.get(record, key)

    key = if @keyForRelationship then @keyForRelationship(key, "belongsTo") else key

    Ember.Logger.debug "-------------------------"
    Ember.Logger.debug key
    Ember.Logger.debug belongsTo
    Ember.Logger.debug record
    Ember.Logger.debug "-------------------------"

    if (Ember.isNone(belongsTo))
      # json[key] = belongsTo
      Ember.Logger.debug "is none  !!!!!!!"
    else
      Ember.Logger.debug "else is none !!!!!!!"
      json['post'] = Ember.get(belongsTo, 'id')
      json['type'] = key

    Ember.Logger.debug "-------------------------"
    Ember.Logger.debug json
    Ember.Logger.debug "-------------------------"

    if (relationship.options.polymorphic)
      @serializePolymorphicType(record, json, relationship)

`export default Obj`
