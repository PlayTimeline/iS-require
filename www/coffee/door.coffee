define ['jquery'], ($) ->
  OPEN_AND_CLOSE_TIME = 5000
  DOOR_DIV = '<div class="door door-left"></div><div class="door door-right"></div>'

  $door   = undefined
  doorway = undefined

  return {
    init: () ->
      $door = $(DOOR_DIV).prependTo 'body'
      doorway = $door.eq(0).width()

    open: () ->
      console.log 'opening'
      $door.animate {width: 0}, OPEN_AND_CLOSE_TIME

    close: () ->
      console.log 'closing'
      $door.animate {width: doorway}, OPEN_AND_CLOSE_TIME, () ->
        $door.css 'width', '50%'

  }