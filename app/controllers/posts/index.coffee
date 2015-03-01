`import Ember from "ember"`
`import ControllerMixin from "ember-cli-pagination/remote/controller-mixin"`

PostsIndex = Ember.ArrayController.extend ControllerMixin,
  # setup our query params
  queryParams: ["page", "perPage", 'queryKey', 'queryVal']

  # binding the property on the paged array
  # to the query params on the controller
  pageBinding: "content.page"
  perPageBinding: "content.perPage"
  totalPagesBinding: "content.totalPages"

  # set default values, can cause problems if left out
  # if value matches default, it won't display in the URL
  page: 1
  perPage: 15

  init: ->
    Ember.Logger.debug " ++++++ posts index init +++++"
    Ember.Logger.debug @get 'content'
    Ember.Logger.debug " ++++++ posts index init +++++"
    @_super()
  #   @set 'content', Ember.Object.create
  #   info: ""
  #   @set 'data', data
  #   console.log "loaded controller ~~~~~~~~"
  # ,
  # lookupItemController: (obj) ->
  #   Ember.Logger.debug "============================="
  #   Ember.Logger.debug obj
  #   Ember.Logger.debug "============================="

  actions:
    search: ->
      Ember.Logger.debug @model.query.queryKey
      Ember.Logger.debug @model.query.queryVal
      @set @model.query.queryKey, @get('searchField')
      @set @model.query.queryVal, @get('searchValue')
      Ember.Logger.debug @model
      Ember.Logger.debug @get('queryKey')
      Ember.Logger.debug @get('queryVal')

`export default PostsIndex`
