define(['jquery', 'underscore', 'backbone', 'js/door'], function($, _, Backbone, Door) {
  var Captain, DEFAULT_TASK, Task, TaskList, TodoView, taskList, ui;
  DEFAULT_TASK = '有什么任务安排吗？';
  $('#taskIpt').attr('placeholder', DEFAULT_TASK);
  Task = Backbone.Model.extend({
    initialize: function() {
      this.bind('change:text', function() {
        var text;
        return text = this.get('text');
      });
      return this.bind('invalid', function(model, error) {
        return alert(error);
      });
    },
    defaults: {
      text: DEFAULT_TASK
    },
    validate: function(task) {
      var text;
      text = $.trim(task.text);
      if (text === DEFAULT_TASK) {
        return 'do not have changed!';
      } else if (!text.length) {
        return 'it is empty!';
      }
    }
  });
  TaskList = Backbone.Collection.extend({
    model: Task
  });
  Captain = Backbone.Router.extend({
    routes: {
      'like/:who': 'out',
      'byebye': 'hide'
    },
    out: function(who) {
      return Door.close();
    },
    hide: function() {
      return $('#todo').slideUp('slow');
    }
  });
  TodoView = Backbone.View.extend({
    el: '#todo',
    tagName: 'div',
    initialize: function() {},
    render: function(list) {
      var template;
      if (list) {
        list = {
          taskList: list.toJSON()
        };
        template = _.template($('#taskListTempl').html(), list);
        return this.$el.find('#taskUl').html(template);
      }
    },
    events: {
      'click #taskBtn': 'addTask',
      'keyup #taskIpt': 'enterAddTask'
    },
    addTask: function() {
      var task;
      task = new Task();
      task.set({
        text: $('#taskIpt').val()
      }, {
        'validate': true
      });
      taskList.add(task);
      $('#taskIpt').val('');
      return this.render(taskList);
    },
    enterAddTask: function(event) {
      event.preventDefault();
      if (event.which === 13) {
        return this.addTask;
      }
    }
  });
  $('#todo').hide();
  taskList = new TaskList();
  return ui = new TodoView();
});

//# sourceMappingURL=todo.js.map
