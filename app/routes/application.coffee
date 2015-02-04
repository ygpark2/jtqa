`import Ember from "ember"`
`import ApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin'`

Obj = Ember.Route.extend ApplicationRouteMixin,
  beforeModel: (transition, queryParams) ->
    @_super(transition)
    Ember.Logger.debug "before model started!!!!!!!!"
    Ember.$.getScript('./javascript/translations/translations-' + CLDR.defaultLanguage + '.js').then ->
      Ember.Logger.debug "------- successfully loaded language file -----"
    .fail (jqxhr, reason, exception) ->
      Ember.Logger.debug "====== lang file load handle failure ======="
      Ember.Logger.debug reason
      Ember.Logger.debug exception
      # handle failure
  actions:
    sessionInvalidationSucceeded: ->
      Ember.Logger.debug "--------------- logout --------------------"
      @transitionTo("index")
    sessionAuthenticationSucceeded: ->
      Ember.Logger.debug "---------------- succeed -------------------"
      Ember.Logger.debug "-----------------------------------"
    sessionAuthenticationFailed: (error) ->
      @controllerFor('application').set('loginErrorMessage', error.message)
      Ember.Logger.debug "x-----------------------------------x"

`export default Obj`
