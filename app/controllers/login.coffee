`import Ember from "ember"`

`import LoginControllerMixin from "simple-auth/mixins/login-controller-mixin"`

Obj = Ember.Controller.extend LoginControllerMixin, {
  authenticatorFactory: 'authenticator:custom'
}

`export default Obj`