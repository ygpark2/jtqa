Obj = Ember.Component.extend
  participant: null,
  saveText: '참가 신청',
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