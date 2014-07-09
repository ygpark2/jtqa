SydneyCarpoolIndexRoute = Ember.Route.extend
  model: ->
    @store.find('post')

`export default SydneyCarpoolIndexRoute`
