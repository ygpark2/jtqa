
Tag = DS.Model.extend
  name: DS.attr 'string'
  created: DS.attr 'date'
  updated: DS.attr 'date'
  posts: DS.hasMany 'post'

`export default Tag`