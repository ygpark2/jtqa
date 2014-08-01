`import Ember from "ember"`

PostsIndexRoute = Ember.Route.extend
  model: (params) ->
    @set('ptype', params.ptype)

    console.log "=============== posts ==================="
    console.log params
    # console.log Ember.RSVP.all [@store.find params.ptype]
    console.log "=============== posts ==================="
    # Ember.RSVP.all @store.find params.ptype
    ###
    (@store.find params.ptype).then (value) ->
      # on fulfillment
      console.log "rsvp ================="
      console.log value
      console.log "+++++++++++++++++++++++"
    , (reason) ->
      # on rejection
      console.log reason
      console.log "++++++++++++++++++++++++"
    ###
    return @get('store').find 'brisbane' # params.ptype
    # Ember.RSVP.all [@store.find params.ptype]
    # Optional controller: used only if exists
    # console.log @container
  ,
  setupController: (controller, model) ->
    # @_super(controller, model)
    # @controllerFor('posts.index').set('data', model);
    console.log "=============== setupController ==================="
    console.log controller
    console.log model.get('ptype')
    console.log "=============== setupController ==================="
    # controller.set('data', [{ title: "Harry Potter", price: 12.99}, {title: "Song Of Ice", price: 19.99}, {title: "Name Of The Wind",price: 10.99}, {title: "Redemption Ark",price: 21.99}]) # @store.find @get('ptype'))

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
