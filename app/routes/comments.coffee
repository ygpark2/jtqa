`import Ember from "ember"`

CommentsRoute = Ember.Route.extend
  model: (params, transition, queryParams) ->
    Ember.Logger.debug "--> comments routes loaded /// --  "
    @modelFor('post').get('comments')

`export default CommentsRoute`
