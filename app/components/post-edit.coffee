`import Ember from "ember"`

Obj = Ember.Component.extend
  # templateName:'components/post/new'
  # post: null,
  saveText: '수정 하기',
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