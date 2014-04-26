define ['jquery', 'js/door'], ($, Door) ->
  Door.init()

  $('body').click () ->
    Door.open()

  $('h1').mouseover () ->
    Door.close()