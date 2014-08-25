`import Ember from "ember"`
# `import paginationController from "./pagination"`

Obj = Ember.ArrayController.extend
  init: ->
    console.log "======= posts array controller loaded! ======"
  #
  # This is for posts controller
  #
  itemController: 'post'

console.log "------ posts array controller loaded !!!! ------"

`export default Obj`
