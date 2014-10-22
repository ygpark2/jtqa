`import Ember from "ember"`

`import ApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin'`

Obj = Ember.Route.extend ApplicationRouteMixin
  beforeModel: ->
    $.getScript('./javascript/translations/translations-' + CLDR.defaultLanguage + '.js').fail (jqxhr, reason, exception) ->
      Ember.Logger.debug "====== lang file load handle failure ======="
      # handle failure

`export default Obj`
