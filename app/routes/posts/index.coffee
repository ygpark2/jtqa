`import Ember from "ember"`

PostsIndexRoute = Ember.Route.extend
  model: (params) ->
    @set('ptype', params.ptype)

    console.log "=============== posts ==================="
    console.log params
    # console.log Ember.RSVP.all [@store.find params.ptype]
    console.log "=============== posts ==================="
    # Ember.RSVP.all @store.find params.ptype

    json = {
      brisbanes: [{
        id:        104,
        category: 'abcd',
        title:    'How do I feed hamsters?',
        name:     'Tom Dale',
        email:    'abcd@test.com',
        phone:    '0413 892 872',
        views:     10,
        total_comments: 2,
        created:  '2014-01-01T12:00:00',
        updated:  '2014-01-01T12:00:00',
        comments: [
          {
            id:        7,
            email:    'test7@abc.com',
            author:   'Tom Dale',
            created:  '2014-01-06T12:00:00',
            updated:  '2014-01-07T12:00:00',
            content:  'Tomster cant eat using knife and a fork because his hands are too small. We are looking for a way to feed him. Any ideas?'
          },
          {
            id:        8,
            email:    'test8@abc.com',
            author:   'Tom Dale',
            created:  '2014-01-08T12:00:00',
            updated:  '2014-01-09T12:00:00',
            content:  'Tomster cant eat using knife and a fork because his hands are too small. We are looking for a way to feed him. Any ideas?'
          }
        ],
        tags:     [
          {
            id:        1,
            tag:      'Tag1',
            created:  '2013-01-01T12:00:00',
            updated:  '2013-01-01T12:00:00',
            posts:    [104]
          },
          {
            id:        3,
            tag:      'Tag3',
            created:  '2013-01-01T12:00:00',
            updated:  '2013-01-01T12:00:00',
            posts:    [104]
          },
          {
            id:        5,
            tag:      'Tag5',
            created:  '2013-01-01T12:00:00',
            updated:  '2013-01-01T12:00:00',
            posts:    [104]
          }
        ],
        content:  'Tomster cant eat using knife and a fork because his hands are too small. We are looking for a way to feed him. Any ideas?'
      },
        {
          id:        105,
          category: 'abcd2',
          title:    'How ddid I feed hamsters?',
          name:     'Tom Dale adw',
          email:    'abcd2@test.com',
          phone:    '0413 892 872',
          views:     11,
          total_comments: 5,
          created:  '2014-01-01T12:00:00',
          updated:  '2014-01-01T12:00:00',
          comments: [
            {
              id:        2,
              email:    'test2@abc.com',
              author:   'Tom Dale',
              created:  '2014-01-02T12:00:00',
              updated:  '2014-01-03T12:00:00',
              content:  'Tomster cant eat using knife and a fork because his hands are too small. We are looking for a way to feed him. Any ideas?'
            },
            {
              id:        4,
              email:    'test4@abc.com',
              author:   'Tom Dale',
              created:  '2014-01-04T12:00:00',
              updated:  '2014-01-05T12:00:00',
              content:  'Tomster cant eat using knife and a fork because his hands are too small. We are looking for a way to feed him. Any ideas?'
            }
          ],
          tags:     [
            {
              id:        9,
              tag:      'Tag9',
              created:  '2013-01-01T12:00:00',
              updated:  '2013-01-01T12:00:00',
              posts:    [105]
            },
            {
              id:        11,
              tag:      'Tag11',
              created:  '2013-01-01T12:00:00',
              updated:  '2013-01-01T12:00:00',
              posts:    [105]
            },
            {
              id:        13,
              tag:      'Tag13',
              created:  '2013-01-01T12:00:00',
              updated:  '2013-01-01T12:00:00',
              posts:    [105]
            }
          ],
          content:  'Tomster cant eat using knife and a fork because his hands are too small. We are looking for a way to feed him. Any ideas?'
        }]
    }

    @store.push('comment',         {
        id:        7,
        email:    'test7@abc.com',
        author:   'Tom Dale',
        created:  '2014-01-06T12:00:00',
        updated:  '2014-01-07T12:00:00',
        content:  'Tomster cant eat using knife and a fork because his hands are too small. We are looking for a way to feed him. Any ideas?',
        post:      104
      })

    @store.push('comment',  {
        id:        8,
        email:    'test8@abc.com',
        author:   'Tom Dale',
        created:  '2014-01-08T12:00:00',
        updated:  '2014-01-09T12:00:00',
        content:  'Tomster cant eat using knife and a fork because his hands are too small. We are looking for a way to feed him. Any ideas?',
        post:      104
      })

    @store.push('tag',
      {
        id:        1,
        tag:      'Tag1',
        created:  '2013-01-01T12:00:00',
        updated:  '2013-01-01T12:00:00',
        posts:    [104]
      })
    @store.push('tag',  {
        id:        3,
        tag:      'Tag3',
        created:  '2013-01-01T12:00:00',
        updated:  '2013-01-01T12:00:00',
        posts:    [104]
      })
    @store.push('tag',  {
        id:        5,
        tag:      'Tag5',
        created:  '2013-01-01T12:00:00',
        updated:  '2013-01-01T12:00:00',
        posts:    [104]
      })
    @store.push('brisbane', {
      id:        104,
      category: 'abcd',
      title:    'How do I feed hamsters?',
      name:     'Tom Dale',
      email:    'abcd@test.com',
      phone:    '0413 892 872',
      views:     10,
      numcmt: 2,
      created:  '2014-01-01T12:00:00',
      updated:  '2014-01-01T12:00:00',
      comments: [7, 8],
      tags:     [1, 3, 5, 9],
      content:  'Tomster cant eat using knife and a fork because his hands are too small. We are looking for a way to feed him. Any ideas?'
    })

    (@store.find params.ptype).then (value) ->
      # on fulfillment
      console.log "rsvp ================="
      console.log value
      console.log "+++++++++++++++++++++++"
      return value
    , (reason) ->
      # on rejection
      console.log "+++++++++++ error +++++++++++"
      console.log reason
      console.log reason.message
      console.log reason.response
      console.log "++++++++++++++++++++++++"
      return reason

    # console.log @store.find 'brisbane'
    # return @store.all 'brisbane' # params.ptype
    # return Ember.RSVP.all [@store.find params.ptype]
    # Optional controller: used only if exists
    # console.log @container
  ,
  setupController: (controller, model) ->
    @_super(controller, model)
    # @controllerFor('posts.index').set('data', model);
    console.log "=============== setupController ==================="
    console.log controller
    console.log model
    console.log model.success()
    console.log "=============== setupController ==================="
    controller.set('data', [{ title: "Harry Potter", price: 12.99}, {title: "Song Of Ice", price: 19.99}, {title: "Name Of The Wind",price: 10.99}, {title: "Redemption Ark",price: 21.99}]) # @store.find @get('ptype'))

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
