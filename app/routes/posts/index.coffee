`import Ember from "ember"`

PostsIndexRoute = Ember.Route.extend
  model: (params) ->
    @set('ptype', params.ptype)

    console.log "=============== posts ==================="
    console.log params
    # console.log Ember.RSVP.all [@store.find params.ptype]
    console.log "=============== posts ==================="
    # Ember.RSVP.all @store.find params.ptype

    (@store.find params.ptype).then (value) ->
      # on fulfillment
      console.log "============ RSVP ============="
      console.log value
      console.log "+++++++++++++++++++++++++++++++"
      return value
    , (reason) ->
      # on rejection
      console.log "============ error ============"
      console.log reason
      console.log reason.message
      console.log reason.response
      console.log "+++++++++++++++++++++++++++++++"
      return reason

    # console.log @store.find 'brisbane'
    # return @store.all 'brisbane' # params.ptype
    # return Ember.RSVP.all [@store.find params.ptype]
    # Optional controller: used only if exists
    # console.log @container
  ,
  setupController: (controller, model, params) ->
    # @controllerFor('posts.index').set('data', model);
    # @_super(controller, model)
    data = [{ title: "Harry Potter", price: 12.99}, {title: "Song Of Ice", price: 19.99}, {title: "Name Of The Wind",price: 10.99}, {title: "Redemption Ark",price: 21.99}]
    console.log "=============== setupController ==================="
    console.log controller
    console.log model
    console.log "=============== setupController ==================="
    controller.set 'model', model
    controller.set 'data', data
    controller.set 'content', data
    controller.set 'page', 1
    controller.set 'ptype', params.ptype
  ,
  renderTemplate: (controller, model) ->
    console.log "=============== render ==================="
    console.log controller
    console.log "=============== render ==================="
    @render()
#    @render @get('postsTemplate'),
#      controller: @get('postsIndexController')
#      into: 'posts'

`export default PostsIndexRoute`
