Obj = Ember.Controller.extend
  # needs: ['posts/details'],
  # postsDetails: Ember.computed.alias('controllers.posts/details'),
  selectedState: '',
  states: [
    {name: "Sydney",    value: "SYD"},
    {name: "Melbourne", value: "MEL"},
    {name: "Brisbane",  value: "BNE"}
  ]

`export default Obj`
