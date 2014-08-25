`import Ember from "ember"`

Obj = Ember.Controller.extend
  # needs: ['posts/details'],
  # postsDetails: Ember.computed.alias('controllers.posts/details'),
  selectedState: '',
  states: [
    {name: "Sydney",    value: "SYD"},
    {name: "Melbourne", value: "MEL"},
    {name: "Brisbane",  value: "BNE"}
  ],
  saveText: '글쓰기',
  cancelText: '취소',
  saveAction: 'save',
  cancelAction: 'cancel',

  actions:
    submit: ->
      console.log @model
      @model.save().then (post) ->
        console.log post
      console.log "+++++++++++++++++++"
      @sendAction('saveAction')
    ,
    cancel: ->
      @sendAction('cancelAction')

`export default Obj`
