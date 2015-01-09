`import Ember from "ember"`

LoginRoute = Ember.Route.extend
  beforeModel: ->
    @csrf.fetchToken()
  ,
  model: ->
    ['red', 'yellow', 'blue']

`export default LoginRoute`
