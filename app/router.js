var Router = Ember.Router.extend(); // ensure we don't share routes between all Router instances

Router.map(function() {

  this.route("login");
  this.route("registration");

  this.route("about");
  this.route("favorites", { path: "/favs" });

  this.route('component-test');
  this.route('helper-test');

  this.resource('posts', function() {
    this.route("index")
    this.route("new")
    this.route("view")
  });
});

export default Router;
