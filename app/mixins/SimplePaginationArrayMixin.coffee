`import Ember from "ember"`

Obj = Ember.Mixin.create
  didRequestRange: () ->
    _this = @
    pageStart = @get('pageStart')
    pageEnd = @get('pageEnd')

    new Ember.RSVP.Promise (resolve, reject) ->
      console.log _this.get('model')
      console.log "didRequestRange ================="
      resolve(_this.get('data').slice(pageStart - 1, pageEnd))
  ,
  didRequestTotal: () ->
    _this = @

    new Ember.RSVP.Promise (resolve, reject) ->
      console.log _this.get('model')
      console.log _this.get('ptype')
      console.log _this.get('page')
      console.log "didRequestTotal ================="
      resolve(_this.get('data').length)

`export default Obj`
