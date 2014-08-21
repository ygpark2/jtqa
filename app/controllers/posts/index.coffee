`import Ember from "ember"`
# `import SimplePaginationMixin from "../../mixins/SimplePaginationMixin"`
# `import SimplePaginationArrayMixin from "../../mixins/SimplePaginationArrayMixin"`

Obj = Ember.ArrayController.extend #  SimplePaginationMixin, SimplePaginationArrayMixin,
  # init: (data) ->
  #   console.log " ++++++ posts index init +++++"
  #   console.log data
  #   console.log @get 'ptype'
  #   console.log " ++++++ posts index init +++++"
  #   @_super({'modelType': 'brisbane'})
  #   @set 'content', Ember.Object.create
  #   info: ""
  #   @set 'data', data
  #   console.log "loaded controller ~~~~~~~~"
  # ,
  needs: ['pagination'],
  lookupItemController: (obj) ->
    console.log "============================="
    console.log obj
    console.log "============================="
  # queryParams: ['page', 'ptype']

`export default Obj`
