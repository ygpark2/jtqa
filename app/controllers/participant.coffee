`import Ember from "ember"`

Obj = Ember.Controller.extend
  selectedState: '',
  states: [
    {name: "Sydney",    value: "SYD"},
    {name: "Melbourne", value: "MEL"},
    {name: "Brisbane",  value: "BNE"}
  ]

console.log "participant controller"

`export default Obj`