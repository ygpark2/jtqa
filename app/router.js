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
    this.resource('carpool', function() {
      this.route("index");
      this.route("new");
      this.route("view");
    });
  });

  this.resource('sydney', function() {
    this.route("index");
    this.route("contact");
    this.route("map");
    this.resource('carpool', function() {
      this.route("index");
      this.route("new");
      this.route("view");
    });
  });

  this.resource('melbourne', function() {
    this.route("index");
    this.route("contact");
    this.route("map");
    this.resource('carpool', function() {
      this.route("index");
      this.route("new");
      this.route("view");
    });
  });

  this.route("participant");

  this.resource('posts', { path: 'posts/:type' }, function() {
      this.route('edit', { path: '/:post_id' });
      this.route('new');
      this.resource('comments', function() {
        this.route('new');
      });
  });

    /*
  this.resource('posts', function() {
      this.route("index");
      this.route("new");
      this.route("view");
      this.route("edit");
  });
     */
});

export default Router;
