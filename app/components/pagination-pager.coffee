`import Ember from "ember"`

Obj = Ember.Component.extend
  tagName: 'ul',
  classNameBindings: ['uikit:uk-pagination', 'paginationSizeClass'],
  uikit: true,
  pager: false,
  pagerNext: 'Next',
  pagerPrevious: 'Previous',
  paginationPrevious: '<<',
  paginationNext: '>>',
  firstPage: 1,
  current: 1,
  windowSize: 3,
  lastPage: Ember.computed.alias('count'),

  currentPage: (->
    return Number(@get('current'))
  ).property('current'),

  paginationSizeClass: (->
    size = @get('size')
    pager = @get('pager')
    return !pager && size && (size == 'lg' || size == 'sm') ? 'pagination-' + size : ''
  ).property('paginationSize'),

  isFirst: (->
    return @get('current') == @get('firstPage')
  ).property('firstPage', 'current'),

  isLast: (->
    return @get('current') == @get('lastPage')
  ).property('lastPage', 'current'),

  pages: (->
    count = @get('count')
    current = @get('current')
    Ember.Logger.debug "current => " + current
    startWindow = current - @get('windowSize')
    endWindow = current + @get('windowSize')
    if startWindow <= @get('firstPage')
      startWindow = @get('firstPage')
    if endWindow >= @get('lastPage')
      endWindow = @get('lastPage')
    Ember.Logger.debug "startWindow => " + startWindow
    Ember.Logger.debug "endWindow => " + endWindow
    x for x in [startWindow..endWindow]
  ).property('count'),

  click: (event) ->
    # stop `#` from jumping to top of page
    event.preventDefault()
  ,

  actions:
    next: ->
      if (!@get('isLast'))
        current = @get('current')
        @set('current', parseInt(current, 10) + 1)
    ,
    previous: ->
      if (!@get('isFirst'))
        current = @get('current')
        @set('current', parseInt(current, 10) - 1)

`export default Obj`
