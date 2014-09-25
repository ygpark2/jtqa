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
  lookupItemController: (obj) ->
    Ember.Logger.debug "============================="
    Ember.Logger.debug obj
    Ember.Logger.debug "============================="
  ,
  actions:
    search: ->
      Ember.Logger.debug @model.query.queryKey
      Ember.Logger.debug @model.query.queryVal
      @set @model.query.queryKey, @get('searchField')
      @set @model.query.queryVal, @get('searchValue')
      Ember.Logger.debug @model
      Ember.Logger.debug @get('queryKey')
      Ember.Logger.debug @get('queryVal')

`export default Obj`
