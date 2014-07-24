`import Ember from "ember"`

PostsIndexRoute = Ember.Route.extend
  controllerName: 'posts/index',
  model: (params, transition) ->
    @set('ptype', params.ptype)
    @set('postsTemplate', "posts/index")

    console.log "=============== posts ==================="
    console.log params
    console.log "=============== posts ==================="
    @store.find params.ptype

    # Optional controller: used only if exists
    console.log @container
    if @container.resolve("controller:#{controllerName}")
      @set('postsIndexController', controllerName)
      console.log "found controller ===================>>>>>>>>>>>"

    return @steps.indexOf(params['step'])

  renderTemplate: (controller, model) ->
    @render()
    @render @get('postsTemplate'),
      controller: @get('postsIndexController')
      into: 'posts'

`export default PostsIndexRoute`
