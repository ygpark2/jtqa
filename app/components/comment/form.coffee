`import Ember from "ember"`

Obj = Ember.Component.extend
  # templateName:'components/post/new'
  # post: null,
  saveText: '코멘트 남기기',
  cancelText: '취소',
  saveAction: 'commentSave',
  cancelAction: 'commentCancel',

  actions:
    submit: ->
      @sendAction('saveAction')
    ,

    cancel: ->
      @sendAction('cancelAction')

`export default Obj`