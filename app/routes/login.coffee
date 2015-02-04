`import Ember from "ember"`

LoginRoute = Ember.Route.extend
  beforeModel: (transition, queryParams)->
    @csrf.fetchToken()
  model: ->
    ['red', 'yellow', 'blue']
  actions:
    sessionAuthenticationSucceeded: ->
      previousTransition = @controllerFor("login").get("previousTransition")
      if (previousTransition)
        @controllerFor("login").set("previousTransition", null)
        previousTransition.retry()
      else
        @transitionTo("index")
      Ember.Logger.debug('Login : Session authentication succeeded')

    sessionAuthenticationFailed: (error) ->
      Ember.Logger.debug @get("previousTransition")
      # Ember.Logger.debug('Login : Session authentication failed with message:', error.message)
      # show generic error
      @controller.set('errorMessage', 'Invalid email/password combination.')

    sessionInvalidationSucceeded: ->
      Ember.Logger.debug('Login : Session invalidation succeeded')

    sessionInvalidationFailed: (error) ->
      Ember.Logger.debug('Login : Session invalidation failed with message:', error.message)

    authorizationFailed: (error) ->
      Ember.Logger.debug @controllerFor("login").get("previousTransition")
      Ember.Logger.debug('Login : Authorization failed with message:')
      # Ember.Logger.debug('Login : Authorization failed with message:', error.message)


`export default LoginRoute`
