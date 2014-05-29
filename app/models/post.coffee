
Post = DS.Model.extend
  title: DS.attr 'string'
  content: DS.attr 'string'
  author: DS.attr 'string'
  created: DS.attr 'date'
  updated: DS.attr 'date'
  tags: DS.hasMany 'tag'
  comments: DS.hasMany 'comment'

Post.reopenClass
  FIXTURES: [
    {
      id:        101,
      title:    'How do I feed hamsters?',
      author:   'Tom Dale',
      created:  '2013-01-01T12:00:00',
      updated:  '2013-01-01T12:00:00',
      content:  'Tomster cant eat using knife and a fork because his hands are \
                 too small. We are looking for a way to feed him. Any ideas?'
    },
    {
      id:        102,
      title:    'Are humans insane?',
      author:   'Tomster the Hamster',
      updated:  '2013-02-02T12:00:00',
      created:  '2013-02-02T12:00:00',
      content:  'I mean are totaly nuts? Is there any hope left for them? Should \
                 we hamsters try to save them?'
    }
  ]

`export default Post`