`import Ember from "ember"`
`import ApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin'`

Obj = Ember.Route.extend(ApplicationRouteMixin,
  beforeModel: ->
    Ember.Logger.debug "before model started!!!!!!!!"
    Ember.$.getScript('./javascript/translations/translations-' + CLDR.defaultLanguage + '.js').then ->
      Ember.Logger.debug "------- successfully loaded language file -----"
    .fail (jqxhr, reason, exception) ->
      Ember.Logger.debug "====== lang file load handle failure ======="
      Ember.Logger.debug reason
      Ember.Logger.debug exception
      # handle failure
)

`export default Obj`
