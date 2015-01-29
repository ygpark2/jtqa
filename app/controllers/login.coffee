`import Ember from "ember"`

`import LoginControllerMixin from "simple-auth/mixins/login-controller-mixin"`

Obj = Ember.Controller.extend LoginControllerMixin,
# authenticatorFactory: 'authenticator:custom'
  authenticator: 'simple-auth-authenticator:token'
# authenticator: 'simple-auth-authenticator:devise'

  rememberMe: false

  rememberMeChanged: (->
    @get('session.store').cookieExpirationTime = if @get('rememberMe') then (14 * 24 * 60 * 60) else null
  ).observes('rememberMe')

  actions:
    # display an error when logging in fails
    sessionAuthenticationFailed: (message) ->
      Ember.Logger.debug('``````` sessionAuthenticationFailed')
      console.log("-----------------------------------------")
      @set('errorMessage', message)

    # handle login success
    sessionAuthenticationSucceeded: ->
      Ember.Logger.debug('sessionAuthenticationSucceeded')
      console.log("-----------------------------------------")

      @set('errorMessage', "")
      @set('identification', "")
      @set('password', "")
      @_super()

`export default Obj`
