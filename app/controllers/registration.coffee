`import Ember from "ember"`

Obj = Ember.Controller.extend

  actions:
    register: ->
      _this = this
      data = @getProperties "email", "password", "password_confirmation"

      if not Ember.isEmpty(data.email) and not Ember.isEmpty(data.password)
        Ember.$.ajax({
          method: "POST"
          url: "http://localhost:3000//users.json"
          dataType: 'json'
          data: {user: data}
        }).then( ((response) ->
          Ember.run (->
            console.log "Registration Suceeded!"
            _this.get("session").setup response
            _this.send "registrationSucceeded", response
          )
        ), ((xhr, status, error)->
          Ember.run (->
            _this.send "registrationFailed", xhr, status, error
            )
          )
        )

    registrationSucceeded: (response) ->
      console.log "Registration Succeeded: #{Ember.inspect response}"

    registrationFailed: (xhr, status, error)->
      console.log "Registration Failed: #{error}"

`export default Obj`