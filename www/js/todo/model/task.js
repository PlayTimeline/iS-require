define(['backbone'], function(Backbone) {
  var Task;
  Task = Backbone.Model.extend({
    defaults: {
      text: '',
      done: false
    },
    toggle: function() {
      return this.save({
        done: !this.get('done')
      });
    }
  });
  return Task;
});

//# sourceMappingURL=task.js.map
