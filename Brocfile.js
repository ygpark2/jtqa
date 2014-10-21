/* global require, module */

var EmberApp = require('ember-cli/lib/broccoli/ember-app');

var app = new EmberApp();

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

// app.import('bower_components/ember-validations/index.js');

// app.import({
//     development: "bower_components/html5shiv/dist/html5shiv.js",
//     production: "bower_components/html5shiv/dist/html5shiv-min.js"
// });

app.import({
    development: "bower_components/moment/moment.js",
    production: "bower_components/moment/min/moment.min.js"
});

// app.import("bower_components/highcharts-release/highcharts-all.js")
// app.import({
//     development: "bower_components/d3/d3.js",
//     production: "bower_components/d3/d3.min.js"
// });

// app.import({
//     development: "bower_components/crossfilter/crossfilter.js",
//     production: "bower_components/crossfilter/crossfilter.min.js"
// });

// app.import({
//     development: "bower_components/dc/dc.js",
//     production: "bower_components/dc/dc.min.js"
// });

app.import('bower_components/uikit/js/uikit.min.js');
app.import('bower_components/uikit/js/components/autocomplete.min.js');
app.import('bower_components/uikit/js/components/datepicker.min.js');
app.import('bower_components/uikit/js/components/form-password.min.js');
app.import('bower_components/uikit/js/components/form-select.min.js');
app.import('bower_components/uikit/js/components/htmleditor.min.js');
app.import('bower_components/uikit/js/components/nestable.min.js');
app.import('bower_components/uikit/js/components/notify.min.js');
app.import('bower_components/uikit/js/components/pagination.min.js');
app.import('bower_components/uikit/js/components/search.min.js');
app.import('bower_components/uikit/js/components/sortable.min.js');
app.import('bower_components/uikit/js/components/sticky.min.js');
app.import('bower_components/uikit/js/components/timepicker.min.js');
app.import('bower_components/uikit/js/components/upload.min.js');

app.import('bower_components/uikit/css/uikit.min.css');
app.import('bower_components/uikit/css/uikit.gradient.min.css');
// app.import('bower_components/uikit/dist/css/uikit.almost-flat.min.css');

// app.import('bower_components/uikit/css/components/uikit.addons.min.css');
// app.import('bower_components/uikit/css/components/uikit.gradient.addons.min.css');
// app.import('bower_components/uikit/dist/css/addons/uikit.almost-flat.addons.min.css');

app.import('bower_components/uikit/fonts/FontAwesome.otf', {
    destDir: 'fonts'
});

app.import('bower_components/uikit/fonts/fontawesome-webfont.eot', {
    destDir: 'fonts'
});

app.import('bower_components/uikit/fonts/fontawesome-webfont.ttf', {
    destDir: 'fonts'
});

app.import('bower_components/uikit/fonts/fontawesome-webfont.woff', {
    destDir: 'fonts'
});

app.import('bower_components/moment/moment.js');

module.exports = app.toTree();
