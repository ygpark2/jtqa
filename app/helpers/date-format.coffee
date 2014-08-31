`import Ember from "ember"`

Obj = Ember.Handlebars.makeBoundHelper (date, format) ->
  moment(date).format(format)

`export default Obj`
