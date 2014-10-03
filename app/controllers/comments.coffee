`import Ember from "ember"`

Comments = Ember.ArrayController.extend
  init: ->
    Ember.Logger.debug "======= comments array controller loaded! ======"
    @_super()
  #
  # This is for posts controller
  #
  # itemController: 'post'

`export default Comments`
