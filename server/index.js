// To use it create some directories under `routes/`
// and then add index.json files for responses
// e.g. `routes/service/index.json`

var fs = require('fs');
var walkRoutes = require('./util/walkRoutes');

module.exports = function(app) {
  var rootdir = './server/routes';

  var routeHandler = function(filePath) {
    return function(req, res) {
      var content=fs.readFileSync(filePath, "utf8");
      res.type('application/json');
      res.send( JSON.parse(content) );
    };
  };

  var routes = walkRoutes(rootdir, /\.json$/);

  var start = './server/routes'.length;
  var cutoff = '/index.json'.length;

  for (var i = 0; i < routes.length; i++) {
    var filePath = routes[i];
    var last = filePath.length - cutoff - start;
    var route = filePath.substr(start, last);
    app.get(route, routeHandler(filePath));
  }
};
