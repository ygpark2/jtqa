`import Ember from "ember"`

Obj = Ember.Component.extend
  # templateName:'components/post/new'
  # post: null,
  saveText: '글쓰기',
  cancelText: '취소',
  saveAction: 'save',
  cancelAction: 'cancel',

  actions:
    submit: ->
      @sendAction('saveAction')
    ,

    cancel: ->
      @sendAction('cancelAction')

`export default Obj`