`import Ember from "ember"`

CommentsRoute = Ember.Route.extend
  beforeModel: ->
    @csrf.fetchToken()
  ,
  model: (params, transition, queryParams) ->
    Ember.Logger.debug "--> comments routes loaded /// --  "
    @modelFor('post').get('comments')

`export default CommentsRoute`
