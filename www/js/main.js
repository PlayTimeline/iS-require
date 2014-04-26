define(['jquery', 'js/door'], function($, Door) {
  Door.init();
  $('body').click(function() {
    return Door.open();
  });
  return $('h1').mouseover(function() {
    return Door.close();
  });
});
