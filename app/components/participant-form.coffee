Obj = Ember.Component.extend
  participant: null,
  saveText: 'Save',
  cancelText: 'Cancel',
  saveAction: 'save',
  cancelAction: 'cancel',

  actions:
    submit: ->
      @sendAction('saveAction')
    ,

    cancel: ->
      @sendAction('cancelAction')

`export default Obj`