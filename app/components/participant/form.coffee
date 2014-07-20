`import Ember from "ember"`

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

console.log "participant form component loaded !!!!!!!!!!!!!!!!!!!!!"

`export default Obj`