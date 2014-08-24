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
  queryParams: ['page', 'sortBy', 'queryKey', 'queryVal'],
  queryKey: null,
  queryVal: null,
  searchField: Ember.computed.oneWay('queryKey'),
  searchValue: Ember.computed.oneWay('queryVal'),
  page: 1,
  sortBy: 'createdAt',
  sortProperties: (->
    [@get('sortBy')]
  ).property('sortBy'),
  currentPathDidChange: (->
    path = @get('currentPath')
    console.log 'path changed to: ' + path
  ).observes('currentPath'),
  lookupItemController: (obj) ->
    console.log "============================="
    console.log obj
    console.log "============================="
  ,
  actions:
    search: ->
      @set 'queryKey', @get('searchField')
      @set 'queryVal', @get('searchValue')
      console.log @get('queryKey')
      console.log @get('queryVal')

`export default Obj`
