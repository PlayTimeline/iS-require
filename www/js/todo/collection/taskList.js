define(['backbone', 'js/todo/model/task', 'localstorage'], function(Backbone, Task) {
  var TaskList;
  TaskList = Backbone.Collection.extend({
    model: Task,
    localStorage: new Backbone.LocalStorage('todo-backbone'),
    getDone: function() {
      return this.where({
        done: true
      });
    },
    getRemaining: function() {
      return this.where({
        done: false
      });
    }
  });
  return TaskList;
});

//# sourceMappingURL=taskList.js.map
