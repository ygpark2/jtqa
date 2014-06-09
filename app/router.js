var Router = Ember.Router.extend(); // ensure we don't share routes between all Router instances

Router.map(function() {

  this.route("login");
  this.route("registration");

  this.route("about");
  this.route("favorites", { path: "/favs" });

  this.resource('brisbane', function() {
    this.route("index");
    this.route("contact");
    this.route("map");
  });

  this.resource('sydney', function() {
    this.route("index");
    this.route("contact");
    this.route("map");
  });

  this.resource('melbourne', function() {
    this.route("index");
    this.route("contact");
    this.route("map");
  });

  this.route("participant");

  this.resource('posts', function() {
    this.route("index");
    this.route("new");
    this.route("view");
  });
});

export default Router;
