define(['jquery', 'js/door', 'js/todo/view/todoView', 'backbone', 'js/todo/route/todoRouter', 'js/todo'], function($, Door, TodoView, Backbone, TodoRouter) {
  var router, todoView;
  Door.init();
  $('body').dblclick(function() {
    return Door.open();
  });
  todoView = new TodoView();
  router = new TodoRouter();
  return Backbone.history.start();
});

//# sourceMappingURL=main.js.map
