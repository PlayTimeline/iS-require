define ['backbone','js/todo/common'],(Backbone,COMMON)->

  TodoRouter = Backbone.Router.extend
    routes:
      '*sconfield': 'setFilter'

    setFilter: (param)->
      COMMON.TodoFilter = param or ''
      COMMON.taskList.trigger 'filter'

  return TodoRouter