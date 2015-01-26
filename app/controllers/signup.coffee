`import Ember from 'ember'`
`import { request } from 'ic-ajax'`

SignupController = Ember.Controller.extend
  needs: ['login']
  actions:
    signup: ->
      user =
        email:                  @get('email')
        password:               @get('password')
        password_confirmation:  @get('password_confirmation')
        name:                   @get('name')
        nickname:               @get('nickname')
        # contact_number:         @get('phone')

      request 'http://localhost:3000/api/v1/auth',
        type: 'POST'
        data: user
        dataType: 'json'
      .then (response) =>
        if response['success']
          Ember.Logger.debug 'Signed up!'
          @get 'controllers.login'
          .get 'session'
          .authenticate 'simple-auth-authenticator:devise',
            identification: user['email']
            password:       user['password']
          @transitionToRoute 'application'
        else
          Ember.Logger.debug 'Oops!'

`export default SignupController`
