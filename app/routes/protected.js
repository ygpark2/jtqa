import Ember from 'ember';

export default Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin, {
  renderTemplate: function() {
    this.render('protected');
  }
});
