`import Ember from "ember"`

IndexRoute = Ember.Route.extend
  model: ->
    ['purple', 'green', 'orange']

`export default IndexRoute`
