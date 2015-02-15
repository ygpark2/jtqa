`import Ember from "ember"`

Obj = Ember.Controller.extend
  init: ->
    Ember.Logger.debug "------------ init ----------------"
    # Ember.Logger.debug @get comments
    Ember.Logger.debug "------------ init ----------------"
  # needs: ['post/comments/index', 'post/comments/new', 'comments']
  # comments: Ember.computed.alias('controllers.comments')
  # comment_form: Ember.computed.alias('controllers.post/comments/new')
  selectedState: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
  states: [
    {name: "Sydney",    value: "SYD"}
    {name: "Melbourne", value: "MEL"}
    {name: "Brisbane",  value: "BNE"}
  ]

`export default Obj`
