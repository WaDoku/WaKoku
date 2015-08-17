# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
balance_columns = (entries_container) ->
  entries = entries_container.find(".entry")
  entries_left = document.createElement('div')
  entries_right = document.createElement('div')
  entries_div = entries_container.find(".entries")
  entries_left.className = 'col-md-6'
  entries_right.className = 'col-md-6'

  entries_div.prepend(entries_right)
  entries_div.prepend(entries_left)
  entries_div.removeClass('col-md-12')

  callback = (res, el) ->
    res + $(el).height()
  height = (collection) ->
    _.reduce(collection, callback, 0)

  entries.remove()
  $(entries_left).append(entries)

  #Put everything in the right column until it is somewhat even.
  while height($(entries_left).children()) > height($(entries_right).children()) + 100
    switcher = $(entries_left).children().last()
    switcher.remove()
    $(entries_right).prepend(switcher)


  #Pad the height of the smaller column
  hlc = $(entries_left).children()
  hrc = $(entries_right).children()
  hl = height(hlc)
  hr = height(hrc)

  if hl > hr
    paddee = hrc
    unpadded = hlc
    padding = (hl - hr) / (hrc.length - 1)
  else
    paddee = hlc
    unpadded = hrc
    padding = (hr - hl) / (hlc.length - 1)

  #Pad them all
  for entry in paddee
    padding_bottom = parseInt($(entry).css('padding-bottom'), 10)
    padding_bottom += padding
    $(entry).css('padding-bottom', padding_bottom)


init = ()->
  balance_columns($('.entries-container').last())

$(window).load(init)
