define ['jquery','js/door',
  'js/todo/view/todoView',
  'backbone',
  'js/todo/route/todoRouter',
  'js/todo'],($,Door,TodoView,Backbone,TodoRouter) ->
  Door.init()

  $('body').dblclick () ->
    Door.open()

  # backbone coming soon
  todoView = new TodoView()
  router   = new TodoRouter()
  Backbone.history.start()