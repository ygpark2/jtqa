`import Ember from "ember"`
`import SimplePaginationMixin from "../../mixins/SimplePaginationMixin"`
`import SimplePaginationArrayMixin from "../../mixins/SimplePaginationArrayMixin"`

Obj = Ember.Controller.extend SimplePaginationMixin, SimplePaginationArrayMixin,
  init: () ->
    @_super()
    #  @set 'content', Ember.Object.create
    #    info: ""
  ,
  pageSize: 4,
  queryParams: ['page'],

  data: []
  # data: [{ title: "Harry Potter", price: 12.99}, {title: "Song Of Ice", price: 19.99}, {title: "Name Of The Wind",price: 10.99}, {title: "Redemption Ark",price: 21.99}, {title: "Leviathan Wakes",price: 10.99}, {title: "Eragon",price: 18.99}, {title: "The Elves",price: 12.99}, {title: "The Orks",price: 10.99}, {title: "The Trolls",price: 13.99},{title: "Harry Potter",price: 12.99}, {title: "Song Of Ice",price: 19.99}, {title: "Name Of The Wind",price: 10.99}, {title: "Redemption Ark",price: 21.99}, {title: "Leviathan Wakes",price: 10.99}, {title: "Eragon",price: 18.99}, {title: "The Elves",price: 12.99}, {title: "The Orks",price: 10.99}, {title: "The Trolls",price: 13.99}]

`export default Obj`
