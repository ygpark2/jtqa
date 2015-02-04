`import Ember from "ember"`

CommentsIndexRoute = Ember.Route.extend
  beforeModel: (transition, queryParams)->
    @csrf.fetchToken()
  model: (params) ->
    Ember.Logger.debug "======== comment model params ============"
    Ember.Logger.debug @modelFor('comments')
    Ember.Logger.debug params
    @modelFor('comments')
  setupController: (controller, model, trans) ->
    controller.set 'model', model

`export default CommentsIndexRoute`
