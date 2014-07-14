`import DS from "ember-data"`

Participant = DS.Model.extend
  state: DS.attr 'string'
  name: DS.attr 'string'
  email: DS.attr 'string'
  phone: DS.attr 'string'
  created: DS.attr 'date'
  updated: DS.attr 'date'

Participant.reopenClass
  FIXTURES: [
    {
      id:        1,
      state:    'MEL',
      name:     'Tom MEL',
      email:    'tom_mel@email.com',
      phone:    '0412-432-412',
      created:  '2013-01-01T12:00:00',
      updated:  '2013-01-01T12:00:00'
    },
    {
      id:        2,
      state:    'BNE',
      name:     'Tom BNE',
      email:    'tom_bne@email.com',
      phone:    '0412-432-412',
      created:  '2013-01-01T12:00:00',
      updated:  '2013-01-01T12:00:00'
    },
    {
      id:        3,
      state:    'SYD',
      name:     'Tom SYD',
      email:    'tom_syd@email.com',
      phone:    '0412-432-412',
      created:  '2013-01-01T12:00:00',
      updated:  '2013-01-01T12:00:00'
    }
  ]

`export default Participant`
