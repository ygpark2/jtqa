`import Ember from "ember"`

Obj = Ember.Mixin.create
  didRequestRange: () ->
    _this = @
    pageStart = @get('pageStart')
    pageEnd = @get('pageEnd')

    new Ember.RSVP.Promise (resolve, reject) ->
      console.log reject
      resolve(_this.get('data').slice(pageStart - 1, pageEnd))
  ,
  didRequestTotal: () ->
    _this = @

    new Ember.RSVP.Promise (resolve, reject) ->
      console.log reject
      resolve(_this.get('data').length)

`export default Obj`