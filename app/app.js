import Ember from 'ember';
import Resolver from 'ember/resolver';
import loadInitializers from 'ember/load-initializers';
import config from './config/environment';
import { setCsrfUrl } from 'rails-csrf/config';

// Ember.MODEL_FACTORY_INJECTIONS = true;
Ember.MODEL_FACTORY_INJECTIONS = false;

var App = Ember.Application.extend({
  modulePrefix: config.modulePrefix,
  podModulePrefix: config.podModulePrefix,
  Resolver: Resolver
});

setCsrfUrl('http://localhost:3000/api/v1/csrf');

loadInitializers(App, config.modulePrefix);
loadInitializers(App, 'rails-csrf');

export default App;
