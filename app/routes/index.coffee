`import Ember from "ember"`

IndexRoute = Ember.Route.extend
  model: ->
    ['red', 'yellow', 'blue']

`export default IndexRoute`
