TRANSLATIONS = {
  'user.edit.title': 'Edit User',
  'user.followers.title.one': 'One Follower',
  'user.followers.title.other': 'All {{count}} Followers',
  'button.add_user.title': 'Add a user',
  'button.add_user.text': 'Add',
  'button.add_user.disabled': 'Saving...'
}

# Takes two parameters: container and app
initialize = () ->
  Ember.I18n.translations = TRANSLATIONS
  # app.register 'route', 'foo', 'service:foo'

I18nInitializer =
  name: 'i18n'
  initialize: initialize

# `export initialize`
`export default I18nInitializer`
