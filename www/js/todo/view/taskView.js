define(['jquery', 'underscore', 'backbone', 'js/todo/common'], function($, _, Backbone, COMMON) {
  var TaskView;
  TaskView = Backbone.View.extend({
    tagName: 'li',
    template: _.template($('#task-template').html()),
    events: {
      'click .toggle': 'toggleDone',
      'dblclick label': 'edit',
      'click .destroy': 'clear',
      'keypress .edit': 'updateOnEnter',
      'keydown .edit': 'revertOnEscape',
      'blur .edit': 'close'
    },
    initialize: function() {
      this.listenTo(this.model, 'change', this.render);
      this.listenTo(this.model, 'destroy', this.remove);
      return this.listenTo(this.model, 'visible', this.toggleVisible);
    },
    render: function() {
      this.$el.html(this.template(this.model.toJSON()));
      this.$el.toggleClass('done', this.model.get('done'));
      this.toggleVisible();
      this.$input = this.$('.edit');
      return this;
    },
    toggleVisible: function() {
      return this.$el.toggleClass('hidden', this.isHidden());
    },
    isHidden: function() {
      var isDone;
      isDone = this.model.get('done');
      return (!isDone && COMMON.TodoFilter === 'done') || (isDone && COMMON.TodoFilter === 'active');
    },
    toggleDone: function() {
      return this.model.toggle();
    },
    edit: function() {
      this.$el.addClass('editing');
      return this.$input.focus();
    },
    close: function() {
      var trimmedValue, value;
      value = this.$input.val();
      trimmedValue = $.trim(value);
      if (!this.$el.hasClass('editing')) {
        return;
      }
      if (trimmedValue) {
        this.model.save({
          text: trimmedValue
        });
        if (value === !trimmedValue) {
          this.model.trigger('change');
        }
      } else {
        this.clear();
      }
      return this.$el.removeClass('editing');
    },
    updateOnEnter: function(e) {
      if (e.which === COMMON.ENTER_KEY) {
        return this.close();
      }
    },
    revertOnEscape: function(e) {
      if (e.which === COMMON.ESC_KEY) {
        return this.$el.removeClass('editing');
      }
    },
    clear: function() {
      return this.model.destroy();
    }
  });
  return TaskView;
});

//# sourceMappingURL=taskView.js.map
