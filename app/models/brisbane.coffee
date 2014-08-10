`import DS from "ember-data"`
`import Post from "jtqa/models/post"`

Brisbane = Post.extend
  category: DS.attr 'string'

###
Brisbane.reopenClass
  FIXTURES: [
    {
      id:        101,
      category: 'abcd',
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
      content:  'Tomster cant eat using knife and a fork because his hands are too small. We are looking for a way to feed him. Any ideas?'
    },
    {
      id:        102,
      category: 'abcde',
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
      content:  'I mean are totaly nuts? Is there any hope left for them? Should we hamsters try to save them?'
    }
  ]
###

`export default Brisbane`
