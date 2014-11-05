`import Ember from 'ember'`
`import EmberValidations from 'ember-validations'`
`import Errors from 'ember-validations/errors'`

Ember.Logger.debug EmberValidations.Mixin

LazyEmberValidationsMixin = Ember.Mixin.create EmberValidations.Mixin,

    _validate: () ->
      @_super()
  ###
  init: () ->
    _this = @
    @errors = Errors.create()
    @dependentValidationKeys = {}
    @validators = Ember.A()
    if typeof @get('validations') is "undefined"
      _this.set('validations', {})

    @buildValidators()

    Ember.run.scheduleOnce 'afterRender', @, () ->
      @validators.forEach( (validator) ->
        validator.addObserver 'errors.[]', @, (sender) ->
          errors = Ember.A()
          @validators.forEach( (validator) ->
            if validator.property == sender.property
              errors.addObjects(validator.errors)
          , @)
          @set('errors.' + sender.property, errors)
      , @)
  ###

`export default LazyEmberValidationsMixin`