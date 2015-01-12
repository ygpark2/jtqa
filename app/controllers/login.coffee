`import Ember from "ember"`

`import LoginControllerMixin from "simple-auth/mixins/login-controller-mixin"`

Obj = Ember.Controller.extend LoginControllerMixin, {
  # authenticatorFactory: 'authenticator:custom'
  authenticator: 'simple-auth-authenticator:token'
  # authenticator: 'simple-auth-authenticator:devise'
}

`export default Obj`
