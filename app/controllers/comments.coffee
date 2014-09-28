`import Ember from "ember"`

Comments = Ember.ArrayController.extend
  init: ->
    console.log "======= comments array controller loaded! ======"
  #
  # This is for posts controller
  #
  # itemController: 'post'

`export default Comments`
