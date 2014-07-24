`import Ember from "ember"`

Obj = Ember.Mixin.create
  page: 1,
  pageSize: 10,
  total: null,
  paginatedContent: null,
  paginationItemCount: 4,

  init: () ->
    _this = @

    @didRequestTotal().then (total) ->
      _this.set('total', total)
    , (cause) ->
      # TODO: proper error handling
  ,
  pageStart: ( ->
    newPageStart = page = parseInt(@get('page'))

    if(Ember.isEmpty(@get('total')))
      return null

    newPageStart = ((page * @get('pageSize')) - @get('pageSize')) + 1
    if(newPageStart > @get('total') ||  newPageStart < 1)
      return null

    return newPageStart
  ).property('page', 'total'),

  pageEnd: ( ->
    if(@get('pageStart') == null)
      return null
    newPageEnd = @get('pageStart') + @get('pageSize')
    if(newPageEnd >= @get('total'))
      newPageEnd = @get('total') + 1
    return newPageEnd - 1
  ).property('pageStart'),

  totalPages: ( ->
    return Math.ceil(@get('total') / @get('pageSize'))
  ).property('total'),

  onPageChanged: ( ->
    _this = @

    if(@get('pageStart') == null)
      return null

    @didRequestRange().then (data) ->
      _this.set('paginatedContent', data)
    , (cause) ->
      #TODO: proper error handling
  ).observes('pageStart').on('init'),

  paginationItems: ( ->
    result = []
    totalPages = @get('totalPages')
    page = parseInt(@get('page'))
    paginationItemCount = @get('paginationItemCount')
    length = (totalPages >= paginationItemCount) ? paginationItemCount : totalPages
    startPos = 0

    if (page  <= Math.floor(paginationItemCount / 2) + 1 || totalPages <= paginationItemCount)
      startPos = 1
    else
      # Check to see if in the last section of pages
    if (page >= totalPages - (Math.ceil(paginationItemCount / 2) - 1))
      # Start pages so that the total number of pages is shown and the last page number is the last page
      startPos = totalPages - ((paginationItemCount - 1))
    else
      # Start pages so that current page is in the center
      startPos = page - (Math.ceil(paginationItemCount / 2) - 1)

    # Go through all of the pages and make an entry into the array
    for i in [0...length]
      paginationItem = i + startPos
      result.push({page: paginationItem, isActive: paginationItem == page})
    return result
  ).property('page', 'itemCount', 'totalPages'),

  previousPage: ( ->
    page = parseInt(@get('page'))

    if(page < 1)
      return null
    return page - 1
  ).property('page'),

  nextPage: ( ->
    page = parseInt(@get('page'))

    if(Ember.isEmpty(@get('totalPages')) || page >= @get('totalPages'))
      return null
    return page + 1
  ).property('page', 'totalPages'),

  didRequestRange: Ember.K,
  didRequestTotal: Ember.K

`export default Obj`