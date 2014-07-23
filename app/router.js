import Ember from 'ember';

var Router = Ember.Router.extend({
  location: JtqaENV.locationType
});

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

    // this.resource('posts', { path: 'posts/:ptype' });

    this.resource('posts', { path: 'posts' }, function() {
        this.route('index', { path: '/:ptype' });
        this.route('edit', { path: '/:ptype/edit/:pid' });
        this.route('show', { path: '/:ptype/show/:pid' });
        this.route('new', { path: '/:ptype/new' });
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
