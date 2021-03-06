`import DS from "ember-data"`

Comment = DS.Model.extend
  comment: DS.attr 'string'
  title: DS.attr 'string'
  created_at: DS.attr 'date'
  updated_at: DS.attr 'date'
  brisbanePost: DS.belongsTo 'brisbane' # , { polymorphic: true }
  sydneyPost: DS.belongsTo 'sydney'
  melbournePost: DS.belongsTo 'melbourne'

###
Comment.reopenClass
  FIXTURES: [
    {
      id:        1,
      email:    'test1@abc.com',
      author:   'Tom Dale',
      created:  '2013-01-01T12:00:00',
      updated:  '2013-01-01T12:00:00',
      content:  'Tomster cant eat using knife and a fork because his hands are \
                 too small. We are looking for a way to feed him. Any ideas?'
    },
    {
      id:        2,
      email:    'test2@abc.com',
      author:   'Tom Dale2',
      created:  '2013-01-01T12:00:00',
      updated:  '2013-01-01T12:00:00',
      content:  'Tomster cant eat using knife and a fork because his hands are \
                 too small. We are looking for a way to feed him. Any ideas?'
    },
    {
      id:        3,
      email:    'test3@abc.com',
      author:   'Tom Dale3',
      created:  '2013-01-01T12:00:00',
      updated:  '2013-01-01T12:00:00',
      content:  'Tomster cant eat using knife and a fork because his hands are \
                 too small. We are looking for a way to feed him. Any ideas?'
    },
    {
      id:        4,
      email:    'test4@abc.com',
      author:   'Tomster the Hamster',
      updated:  '2013-02-02T12:00:00',
      created:  '2013-02-02T12:00:00',
      comments: [2, 4],
      content:  'I mean are totaly nuts? Is there any hope left for them? Should \
                 we hamsters try to save them?'
    }
  ]
###

`export default Comment`
