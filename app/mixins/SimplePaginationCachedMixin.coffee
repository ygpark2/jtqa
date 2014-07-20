`import Ember from "ember"`

Obj = Ember.Mixin.create
  rangeCache: {}

  onPageChanged: () ->
    _this = @
    key = ""

    if (@get('pageStart') == null)
      return null

    key = @get('pageStart')+'+'+@get('pageSize')
    if Ember.isEmpty(@rangeCache[key])
      @didRequestRange().then (data) ->
        _this.get('rangeCache')[key] = data
        _this.set('paginatedContent', data)
      , (cause) ->
        # TODO: proper error handling
        # null
    else
      @set('paginatedContent', @rangeCache[key])
  observes('pageStart').on('init'),

  clearCache: () ->
    @set('rangeCache', {})

`export default Obj`