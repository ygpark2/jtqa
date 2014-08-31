`import Ember from "ember"`

Obj = Ember.Handlebars.makeBoundHelper (items, block) ->

    delimiter = block.hash.delimiter || ","
    start = block.hash.start || 0 
    len = if items then items.length else 0
    end = block.hash.end || len
    out = ""

    if (end > len)
      end = len

    if typeof block is 'function'
        for idx in [start..end]
            if (idx > start)
                out += delimiter
            if typeof items[idx] is 'string'
                out += items[idx]
            else
                out += block(items[idx])
        return out
    else
        Ember.Logger.debug "This is else statement for block checking of function"
        Ember.Logger.debug items
        Ember.Logger.debug start
        Ember.Logger.debug end
        Ember.Logger.debug "-----------------------------------------------------"
        return [].concat(items).slice(start, end).join(delimiter)

`export default Obj`