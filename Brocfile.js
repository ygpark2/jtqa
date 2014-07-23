/* global require, module */

var EmberApp = require('ember-cli/lib/broccoli/ember-app');

var app = new EmberApp({
    name: require('./package.json').name,

    minifyCSS: {
        enabled: true,
        options: {}
    },

    getEnvJSON: require('./config/environment')
});

// Use this to add additional libraries to the generated output files.
app.import('vendor/ember-data/ember-data.js');

app.import('vendor/uikit/dist/js/uikit.min.js');
app.import('vendor/uikit/dist/js/addons/autocomplete.min.js');
app.import('vendor/uikit/dist/js/addons/datepicker.min.js');
app.import('vendor/uikit/dist/js/addons/form-password.min.js');
app.import('vendor/uikit/dist/js/addons/form-select.min.js');
app.import('vendor/uikit/dist/js/addons/htmleditor.min.js');
app.import('vendor/uikit/dist/js/addons/nestable.min.js');
app.import('vendor/uikit/dist/js/addons/notify.min.js');
app.import('vendor/uikit/dist/js/addons/pagination.min.js');
app.import('vendor/uikit/dist/js/addons/search.min.js');
app.import('vendor/uikit/dist/js/addons/sortable.min.js');
app.import('vendor/uikit/dist/js/addons/sticky.min.js');
app.import('vendor/uikit/dist/js/addons/timepicker.min.js');
app.import('vendor/uikit/dist/js/addons/upload.min.js');

app.import('vendor/uikit/dist/css/uikit.min.css');
app.import('vendor/uikit/dist/css/uikit.gradient.min.css');
// app.import('vendor/uikit/dist/css/uikit.almost-flat.min.css');

// app.import('vendor/uikit/dist/css/addons/uikit.almost-flat.addons.min.css');
// app.import('vendor/uikit/dist/css/addons/uikit.gradient.addons.min.css');
// app.import('vendor/uikit/dist/css/addons/uikit.addons.min.css');

// app.import('vendor/bootstrap/dist/js/bootstrap.js');
// app.import('vendor/bootstrap/dist/css/bootstrap.css');
// app.import('vendor/bootstrap/dist/css/bootstrap.css.map');

// If the library that you are including contains AMD or ES6 modules that
// you would like to import into your application please specify an
// object with the list of modules as keys along with the exports of each
// module as its value.
/*
app.import('vendor/ic-ajax/dist/named-amd/main.js', {
    'ic-ajax': [
        'default',
        'defineFixture',
        'lookupFixture',
        'raw',
        'request',
    ]
});
*/

// Use `app.import` to add additional libraries to the generated
// output files.
//
// If you need to use different assets in different
// environments, specify an object as the first parameter. That
// object's keys should be the environment name and the values
// should be the asset to use in that environment.
//
// If the library that you are including contains AMD or ES6
// modules that you would like to import into your application
// please specify an object with the list of modules as keys
// along with the exports of each module as its value.

module.exports = app.toTree();
