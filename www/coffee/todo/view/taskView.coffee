define ['jquery',
  'underscore',
  'backbone',
  'js/todo/common'],($,_,Backbone,COMMON)->

  TaskView = Backbone.View.extend
    tagName: 'li'
    template: _.template $('#task-template').html()
    events:
      'click .toggle': 'toggleDone',
      'dblclick label': 'edit',
      'click .destroy': 'clear',
      'keypress .edit': 'updateOnEnter',
      'keydown .edit': 'revertOnEscape',
      'blur .edit': 'close'

    initialize: ()->
      @listenTo @model,'change',@render
      @listenTo @model,'destroy',@remove
      @listenTo @model,'visible',@toggleVisible

    render: ()->
      @$el.html @template(@model.toJSON())
      @$el.toggleClass 'done',@model.get('done')
      @toggleVisible()
      @$input = @$ '.edit'
      return this

    toggleVisible: ()->
      @$el.toggleClass 'hidden',@isHidden()

    isHidden: ()->
      isDone = @model.get 'done'
      return (not isDone and COMMON.TodoFilter is 'done') or (isDone and COMMON.TodoFilter is 'active')

    toggleDone: ()->
      @model.toggle()

    edit: ()->
      @$el.addClass 'editing'
      @$input.focus()

    close: ()->
      value = @$input.val()
      trimmedValue = $.trim value

      if not @$el.hasClass 'editing' then return
      if trimmedValue
        @model.save {text: trimmedValue}
        if value is not trimmedValue
          @model.trigger 'change'
      else
        @clear()

      @$el.removeClass 'editing'

    updateOnEnter: (e)->
      if e.which is COMMON.ENTER_KEY
        @close()

    revertOnEscape: (e)->
      if e.which is COMMON.ESC_KEY
        @$el.removeClass 'editing'

    clear: ()->
      @model.destroy()

  return TaskView