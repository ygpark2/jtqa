`import Ember from "ember"`

Obj = Ember.ArrayController.extend
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
  lookupItemController: (obj) ->
    Ember.Logger.debug "============================="
    Ember.Logger.debug obj
    Ember.Logger.debug "============================="
  ,
  actions:
    search: ->
      @set 'queryKey', @get('searchField')
      @set 'queryVal', @get('searchValue')
      Ember.Logger.debug @get('queryKey')
      Ember.Logger.debug @get('queryVal')

`export default Obj`
