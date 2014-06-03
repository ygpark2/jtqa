
Tag = DS.Model.extend
  name: DS.attr 'string'
  created: DS.attr 'date'
  updated: DS.attr 'date'
  posts: DS.hasMany 'post'

Tag.reopenClass
  FIXTURES: [
    {
      id:        1,
      tag:      'Tag1',
      created:  '2013-01-01T12:00:00',
      updated:  '2013-01-01T12:00:00',
      posts:    [101]
    },
    {
      id:        2,
      tag:      'Tag2',
      created:  '2013-01-01T12:00:00',
      updated:  '2013-01-01T12:00:00',
      posts:    [101]
    },
    {
      id:        3,
      tag:      'Tag3',
      created:  '2013-01-01T12:00:00',
      updated:  '2013-01-01T12:00:00',
      posts:    [101]
    },
    {
      id:        4,
      tag:      'Tag4',
      created:  '2013-01-01T12:00:00',
      updated:  '2013-01-01T12:00:00',
      posts:    [102]
    },
    {
      id:        5,
      tag:      'Tag5',
      created:  '2013-01-01T12:00:00',
      updated:  '2013-01-01T12:00:00',
      posts:    [102]
    },
    {
      id:        6,
      tag:      'Tag6',
      created:  '2013-01-01T12:00:00',
      updated:  '2013-01-01T12:00:00',
      posts:    [102]
    }
  ]
 
`export default Tag`
