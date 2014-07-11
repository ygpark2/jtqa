PostEditRoute = Ember.Route.extend
  model: ->
    @store.find 'post'

`export default PostEditRoute`
