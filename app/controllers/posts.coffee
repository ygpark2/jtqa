`import Ember from "ember"`
# `import paginationController from "./pagination"`

Posts = Ember.ArrayController.extend
  init: ->
    @_super()
    Ember.Logger.debug "======= posts array controller loaded! ======"
  #
  # This is for posts controller
  #
  # itemController: 'post'
  # needs: ['pagination'],
  # queryParams: ['page', 'pageSize', 'sortBy', 'queryKey', 'queryVal'],
  # queryKey: null,
  # queryVal: null,
  # searchField: Ember.computed.oneWay('queryKey'),
  # searchValue: Ember.computed.oneWay('queryVal'),
  # page: 1,
  # pageSize: 10,
  # sortBy: 'createdAt',
  # sortProperties: (->
  #   [@get('sortBy')]
  # ).property('sortBy'),
  # currentPathDidChange: (->
  #   path = @get('currentPath')
  #   Ember.Logger.debug 'path changed to: ' + path
  # ).observes('currentPath')

`export default Posts`
