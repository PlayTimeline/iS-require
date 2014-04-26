define(['jquery'], function($) {
  var $door, DOOR_DIV, OPEN_AND_CLOSE_TIME, doorway;
  OPEN_AND_CLOSE_TIME = 5000;
  DOOR_DIV = '<div class="door door-left"></div><div class="door door-right"></div>';
  $door = void 0;
  doorway = void 0;
  return {
    init: function() {
      $door = $(DOOR_DIV).prependTo('body');
      return doorway = $door.eq(0).width();
    },
    open: function() {
      console.log('opening');
      return $door.animate({
        width: 0
      }, OPEN_AND_CLOSE_TIME);
    },
    close: function() {
      console.log('closing');
      return $door.animate({
        width: doorway
      }, OPEN_AND_CLOSE_TIME, function() {
        return $door.css('width', '50%');
      });
    }
  };
});
