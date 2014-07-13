import Ember from 'ember';

var Router = Ember.Router.extend({
  location: MyNewAppENV.locationType
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

    this.resource('posts', { path: 'posts/:ptype' });

    this.resource('post', { path: 'post/:ptype' }, function() {
        this.route('edit', { path: '/edit/:pid' });
        this.route('show', { path: '/show/:pid' });
        this.route('new', { path: '/new' });
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
