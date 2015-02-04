`import Ember from "ember"`

IndexRoute = Ember.Route.extend
  beforeModel: (transition, queryParams)->
    @csrf.fetchToken()
  ,
  model: ->
    ['red', 'yellow', 'blue']

`export default IndexRoute`
