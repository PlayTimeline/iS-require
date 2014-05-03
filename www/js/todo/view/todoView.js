define(['jquery', 'underscore', 'backbone', 'js/todo/common', 'js/todo/collection/taskList', 'js/todo/view/taskView'], function($, _, Backbone, COMMON, TaskList, TaskView) {
  var TodoView, taskList;
  taskList = new TaskList();
  COMMON.taskList = taskList;
  TodoView = Backbone.View.extend({
    el: '#todoApp',
    statsTemplate: _.template($('#stats-template').html()),
    events: {
      'keypress #todoNew': 'createOnEnter',
      'click #clearDone': 'clearDone',
      'click #toggleAll': 'toggleAllDone'
    },
    initialize: function() {
      this.$allCheckbox = $('#toggleAll');
      this.$input = $('#todoNew');
      this.$footer = $('#todoFooter');
      this.$main = $('#todoMain');
      this.$list = $('#todoList');
      this.listenTo(taskList, 'add', this.addOne);
      this.listenTo(taskList, 'reset', this.addAll);
      this.listenTo(taskList, 'change:done', this.filterOne);
      this.listenTo(taskList, 'filter', this.filterAll);
      this.listenTo(taskList, 'all', this.render);
      return taskList.fetch({
        reset: true
      });
    },
    render: function() {
      var dCount, rCount;
      dCount = taskList.getDone().length;
      rCount = taskList.getRemaining().length;
      if (taskList.length) {
        this.$main.show();
        this.$footer.show();
        this.$footer.html(this.statsTemplate({
          doneCount: dCount,
          remainingCount: rCount
        }));
        this.$('#todoFilters li a').removeClass('selected').filter("[href='#/" + COMMON.TodoFilter + "']").addClass('selected');
      } else {
        this.$main.hide();
        this.$footer.hide();
      }
      return this.$allCheckbox.data('checked', !dCount);
    },
    addOne: function(t) {
      var taskView;
      taskView = new TaskView({
        model: t
      });
      return this.$list.append(taskView.render().el);
    },
    addAll: function() {
      this.$list.html('');
      return taskList.each(this.addOne, this);
    },
    filterOne: function(t) {
      return t.trigger('visible');
    },
    filterAll: function() {
      return COMMON.taskList.each(this.filterOne, this);
    },
    newAttributes: function() {
      return {
        text: this.$input.val().trim(),
        done: false
      };
    },
    createOnEnter: function(e) {
      if (e.which === COMMON.ENTER_KEY && this.$input.val().trim()) {
        taskList.create(this.newAttributes());
        return this.$input.val('');
      }
    },
    clearDone: function() {
      _.invoke(taskList.getDone(), 'destroy');
      return false;
    },
    toggleAllDone: function() {
      var done;
      done = this.$allCheckbox.data('checked');
      return taskList.each(function(t) {
        return t.save({
          done: done
        });
      });
    }
  });
  return TodoView;
});

//# sourceMappingURL=todoView.js.map
