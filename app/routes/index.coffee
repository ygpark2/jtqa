`import Ember from "ember"`

IndexRoute = Ember.Route.extend
  beforeModel: ->
    @csrf.fetchToken()
  ,
  model: ->
    ['red', 'yellow', 'blue']

`export default IndexRoute`
