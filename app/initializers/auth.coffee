###
  Make sure you've added Em.SimpleAuth to your project
  bower install ember-simple-auth
###
auth =
  name: "authentication",
  initialize: (container, application) ->
    Em.SimpleAuth.setup container, application, {
      authorizerFactory: "ember-simple-auth-authorizer:oauth2-bearer",
      crossOriginWhitelist: [window.ENV.server]
      routeAfterLogin: "index"
      routeAfterLogout: "login"
    }
    Em.SimpleAuth.Authenticators.OAuth2.reopen({
      serverTokenEndpoint: window.ENV.server + "/oauth/token"
    })

`export default auth`