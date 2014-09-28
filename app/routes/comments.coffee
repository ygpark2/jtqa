`import Ember from "ember"`

CommentsRoute = Ember.Route.extend
  model: (params, transition, queryParams) ->
    Ember.Logger.debug "--> comments routes loaded /// --  "
    @modelFor('post').get('comments')
  # setupController: (controller, model, params) ->
  #   @controllerFor('posts.index').set('data', model);
  #   @_super(controller, model)
  #   data = [{ title: "Harry Potter", price: 12.99}, {title: "Song Of Ice", price: 19.99}, {title: "Name Of The Wind",price: 10.99}, {title: "Redemption Ark",price: 21.99}]
  #   console.log "=============== setupController ==================="
  #   console.log controller
  #   console.log model
  #   console.log params
  #   console.log "=============== setupController ==================="
  #   controller.set 'model', model
  #   controller.set 'data', data
  #   controller.set 'page', 1
  #   controller.set 'ptype', params.ptype
  # ,
  # renderTemplate: (controller, model) ->
  #   console.log "=============== render ==================="
  #   console.log controller
  #   console.log "=============== render ==================="
  #   @render()
  #   @render @get('postsTemplate'),
  #     controller: @get('postsIndexController')
  #     into: 'posts'

`export default CommentsRoute`
