`import DS from "ember-data"`

Post = DS.Model.extend
  title: DS.attr 'string'
  content: DS.attr 'string'
  name: DS.attr 'string'
  email: DS.attr 'string'
  phone: DS.attr 'string'
  views: DS.attr 'number'
  total_comments: DS.attr 'number'
  created_at: DS.attr 'date'
  updated_at: DS.attr 'date'
  tag_list: DS.attr 'string'
  tags: DS.hasMany 'tag', {async:true}
  comments: DS.hasMany 'comment', {async: true}

###
  tag_list: (->
    Ember.Logger.debug "------------- tag list ------------------"
    Ember.Logger.debug @get('tags')
    Ember.Logger.debug "------------- tag list ------------------"
    tags = @get('tags').content.content
    tags.join(", ")
  ).property('tags')


Post.reopenClass
  FIXTURES: [
    {
      id:        101,
      title:    'How do I feed hamsters?',
      name:     'Tom Dale',
      email:    'abcd@test.com',
      phone:    '0413 892 872',
      views:     10,
      total_comments: 2,
      created:  '2014-01-01T12:00:00',
      updated:  '2014-01-01T12:00:00',
      comments: [1, 3],
      tags:     [1, 2, 3],
      content:  'Tomster cant eat using knife and a fork because his hands are \
                 too small. We are looking for a way to feed him. Any ideas?'
    },
    {
      id:        102,
      title:    'Are humans insane?',
      name:     'Bob Dale',
      email:    'test@test.com',
      phone:    '0413 123 902',
      views:     10,
      total_comments: 2,
      updated:  '2013-02-02T12:00:00',
      created:  '2013-02-02T12:00:00',
      comments: [2, 4],
      tags:     [4, 5, 6],
      content:  'I mean are totaly nuts? Is there any hope left for them? Should \
                 we hamsters try to save them?'
    }
  ]
###

`export default Post`
