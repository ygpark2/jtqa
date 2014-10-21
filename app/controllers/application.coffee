`import Ember from "ember"`
`import EmberValidations from 'ember-validations'`

Obj = Ember.ObjectController.extend(EmberValidations.Mixin,
  selectedProgrammer: null,
  programmers: [
    "Yehuda",
    "Tom"
  ]
)

Ember.Logger.debug "This is application controller!"

`export default Obj`
