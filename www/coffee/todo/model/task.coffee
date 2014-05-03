define ['backbone'],(Backbone)->

  Task = Backbone.Model.extend
    defaults:
      text: '',
      done: false

    toggle: ()->
      @save
        done: not @get 'done'

  return Task