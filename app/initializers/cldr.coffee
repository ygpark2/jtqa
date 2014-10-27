`import Ember from "ember"`

Obj = {
  name: 'cldr'

  initialize: () ->
    lang = Ember.$.cookie('user-lang')

    if (lang == undefined)  # no cookie exists yet
      lang = 'ko'
      Ember.$.cookie('user-lang', lang, {expires:365, path:'/'})

    CLDR.defaultLanguage = lang
}

`export default Obj`
