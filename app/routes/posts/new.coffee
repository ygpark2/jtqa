PostNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'post'

  actions:
    save: ->
      @currentModel.save().then (post) ->
        @transitionTo 'post.show', post

    cancel: ->
      @transitionTo 'posts.index'

`export default PostNewRoute`
