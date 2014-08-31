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
  queryParams: ['page', 'pageSize', 'sortBy', 'queryKey', 'queryVal'],
  queryKey: null,
  queryVal: null,
  searchField: Ember.computed.oneWay('queryKey'),
  searchValue: Ember.computed.oneWay('queryVal'),
  page: 1,
  pageSize: 10,
  sortBy: 'createdAt',
  sortProperties: (->
    [@get('sortBy')]
  ).property('sortBy'),
  currentPathDidChange: (->
    path = @get('currentPath')
    Ember.Logger.debug 'path changed to: ' + path
  ).observes('currentPath'),
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
