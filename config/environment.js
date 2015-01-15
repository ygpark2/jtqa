/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'jtqa',
    environment: environment,
    baseURL: '/',
    locationType: 'auto',
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
        'query-params-new': true
      }
    },
    contentSecurityPolicy: {
      'default-src': "'none'",
      'script-src': "'self' 'unsafe-inline' 'unsafe-eval' use.typekit.net connect.facebook.net maps.googleapis.com maps.gstatic.com",
      'font-src': "'self' data: use.typekit.net",
      'connect-src': "'self' localhost:3000",
      'img-src': "'self' www.facebook.com p.typekit.net",
      'style-src': "'self' 'unsafe-inline' use.typekit.net",
      'frame-src': "s-static.ak.facebook.com static.ak.facebook.com www.facebook.com"
    },
    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    }
  };

  ENV.coffeeOptions = {
    blueprints: false
  };

  ENV['simple-auth'] = {
    // store: 'simple-auth-session-store:cookie',
    authorizer: 'simple-auth-authorizer:token',
    crossOriginWhitelist: ['http://localhost:3000/'] // For CORS
  };

  ENV['simple-auth-cookie-store'] = {
    cookieName: 'jungto-cookie-store',
    cookieDomain: 'localhost'
  };

  ENV['simple-auth-token'] = {
    serverTokenEndpoint: 'http://localhost:3000/api/v1/auth/sign_in',
    identificationField: 'email',
    tokenPropertyName: 'token',
    authorizationPrefix: 'Bearer ',
    authorizationHeaderName: 'Authorization',
  };

  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    ENV.APP.LOG_VIEW_LOOKUPS = true;

  }

  if (environment === 'test') {
    // Testem prefers this...
    ENV.baseURL = '/';
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
  }

  if (environment === 'production') {

  }

  return ENV;
};
