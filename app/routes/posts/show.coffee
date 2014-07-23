`import Ember from "ember"`

PostViewRoute = Ember.Route.extend
  model: ->
    @store.find 'post'

`export default PostViewRoute`
