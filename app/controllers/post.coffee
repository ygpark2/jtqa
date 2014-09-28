`import Ember from "ember"`

Post = Ember.Controller.extend
  init: ->
    Ember.Logger.debug "------------ post controller init ----------------"
  # needs: ['pagination'],
  # content: {},
  # ptype: null,

`export default Post`
