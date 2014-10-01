`import Ember from "ember"`

Post = Ember.Controller.extend
  init: ->
    Ember.Logger.debug "------------ post controller init ----------------"
    @._super()
  # needs: ['pagination'],
  # content: {},
  # ptype: null,

`export default Post`
