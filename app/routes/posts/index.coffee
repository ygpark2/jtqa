`import Ember from "ember"`

PostsIndexRoute = Ember.Route.extend
  controllerName: 'posts/index',
  model: (params) ->
    @set('ptype', params.ptype)
    @set('postsTemplate', "posts/index")
    @set('controllerName', "posts/index")

    console.log "=============== posts ==================="
    console.log params
    console.log "=============== posts ==================="
    @store.find params.ptype

    # Optional controller: used only if exists
    console.log @container
  ,
  setupController: (controller, model) ->
    console.log "=============== setupController ==================="
    console.log controller
    console.log model
    console.log "=============== setupController ==================="
    controller.set('model', model)
###
  ,
  renderTemplate: (controller, model) ->
    console.log "=============== render ==================="
    console.log controller
    console.log "=============== render ==================="
    @render()
    @render @get('postsTemplate'),
      controller: @get('postsIndexController')
      into: 'posts'
###

`export default PostsIndexRoute`
