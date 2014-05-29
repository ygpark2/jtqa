Router = Ember.Router.extend()

Router.map ->
  @route "login"
  @route "registration"

  @route "about"
  @route "favorites", { path: "/favs" }

  @route "component-test"
  @route "helper-test"

  @resource "posts", ->
    @route "index"
    @route "new"
    @route "details"

`export default Router`
