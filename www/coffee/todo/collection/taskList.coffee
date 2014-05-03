define ['backbone','js/todo/model/task','localstorage'],(Backbone,Task)->

  TaskList = Backbone.Collection.extend
    model: Task
    localStorage: new Backbone.LocalStorage 'todo-backbone'

    getDone: ()->
      @where {done: true}

    getRemaining: ()->
      @where {done: false}

  return TaskList