`import Ember from "ember"`

`import LoginControllerMixin from "simple-auth/mixins/login-controller-mixin"`

Obj = Ember.Controller.extend LoginControllerMixin, {
  # authenticatorFactory: 'authenticator:custom'
  authenticator: 'simple-auth-authenticator:token'
  # authenticator: 'simple-auth-authenticator:devise'
  rememberMe: false

  rememberMeChanged: (->
    @get('session.store').cookieExpirationTime = if @get('rememberMe') then (14 * 24 * 60 * 60) else null
  ).observes('rememberMe')
}

`export default Obj`
