`import Ember from "ember"`

PostNewRoute = Ember.Route.extend
  model: ->
    @store.find 'post'

`export default PostNewRoute`
