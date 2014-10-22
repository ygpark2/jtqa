`import Ember from "ember"`

Obj = {
  name: 'cldr'

  initialize: () ->
    cookie = Ember.get('cookie')

    Ember.Logger.debug cookie
    lang = Ember.$.cookie('user-lang')

    if (lang == undefined)  # no cookie exists yet
      lang = 'en'
      Ember.$.cookie('user-lang', lang, {expires:365, path:'/'})

    CLDR.defaultLanguage = lang
}

`export default Obj`
