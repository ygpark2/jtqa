`import Ember from "ember"`

Obj = Ember.Controller.extend
  needs: ['posts/comments/index', 'posts/comments/new']
  comments: Ember.computed.alias('controllers.posts/comments/index')
  comment_form: Ember.computed.alias('controllers.posts/comments/new')
  selectedState: ''
  states: [
    {name: "Sydney",    value: "SYD"}
    {name: "Melbourne", value: "MEL"}
    {name: "Brisbane",  value: "BNE"}
  ]

`export default Obj`
