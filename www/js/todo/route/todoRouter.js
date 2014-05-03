define(['backbone', 'js/todo/common'], function(Backbone, COMMON) {
  var TodoRouter;
  TodoRouter = Backbone.Router.extend({
    routes: {
      '*sconfield': 'setFilter'
    },
    setFilter: function(param) {
      COMMON.TodoFilter = param || '';
      return COMMON.taskList.trigger('filter');
    }
  });
  return TodoRouter;
});

//# sourceMappingURL=todoRouter.js.map
