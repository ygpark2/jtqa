PostsIndexRoute = Ember.Route.extend
  model: ->
    @store.find('post')

`export default PostsIndexRoute`
