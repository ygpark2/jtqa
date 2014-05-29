
Comment = DS.Model.extend
  content: DS.attr 'string'
  author: DS.attr 'string'
  email: DS.attr 'string'
  created: DS.attr 'date'
  updated: DS.attr 'date'
  comments: DS.hasMany 'comment'

`export default Comment`