Obj = Ember.Controller.extend
  save: (post) ->
    console.log "save!!!!!!!!",
  selectedState: '',
  states: [
    {name: "Sydney",    value: "SYD"},
    {name: "Melbourne", value: "MEL"},
    {name: "Brisbane",  value: "BNE"}
  ]

console.log "posts readed"

`export default Obj`
