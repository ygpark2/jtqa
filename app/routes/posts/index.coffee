PostIndexRoute = Ember.Route.extend
  model: ->
    @store.findAll('post')

`export default PostIndexRoute`
