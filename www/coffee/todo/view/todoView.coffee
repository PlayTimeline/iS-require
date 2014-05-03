define ['jquery',
  'underscore',
  'backbone',
  'js/todo/common',
  'js/todo/collection/taskList',
  'js/todo/view/taskView'],($,_,Backbone,COMMON,TaskList,TaskView)->

  taskList = new TaskList()

  COMMON.taskList = taskList

  TodoView = Backbone.View.extend
    el: '#todoApp'
    statsTemplate: _.template $('#stats-template').html()
    events:
      'keypress #todoNew': 'createOnEnter',
      'click #clearDone': 'clearDone',
      'click #toggleAll': 'toggleAllDone'

    initialize: ()->
      @$allCheckbox = $ '#toggleAll'
      @$input       = $ '#todoNew'
      @$footer      = $ '#todoFooter'
      @$main        = $ '#todoMain'
      @$list        = $ '#todoList'

      @listenTo taskList,'add',@addOne
      @listenTo taskList,'reset',@addAll
      @listenTo taskList,'change:done',@filterOne
      @listenTo taskList,'filter',@filterAll
      @listenTo taskList,'all',@render

      taskList.fetch {reset: true}

    render: ()->
      dCount = taskList.getDone().length
      rCount = taskList.getRemaining().length

      if taskList.length
        @$main.show()
        @$footer.show()
        @$footer.html @statsTemplate
          doneCount: dCount,
          remainingCount: rCount
        @$('#todoFilters li a').removeClass('selected').filter("[href='#/#{COMMON.TodoFilter}']").addClass 'selected'
      else
        @$main.hide()
        @$footer.hide()

      @$allCheckbox.data 'checked',not dCount

    addOne: (t)->
      taskView = new TaskView {model: t}
      @$list.append taskView.render().el

    addAll: ()->
      @$list.html ''
      taskList.each @addOne,this

    filterOne: (t)->
      t.trigger 'visible'

    filterAll: ()->
      COMMON.taskList.each @filterOne, this

    newAttributes: ()->
      return {
        text: @$input.val().trim()
        done: false
      }

    createOnEnter: (e)->
      if e.which is COMMON.ENTER_KEY and @$input.val().trim()
        taskList.create @newAttributes()
        @$input.val ''

    clearDone: ()->
      _.invoke taskList.getDone(),'destroy'
      return false

    toggleAllDone: ()->
      done = @$allCheckbox.data 'checked'
      taskList.each (t)->
        t.save
          done: done

  return TodoView